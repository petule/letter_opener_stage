require "cgi"
require "erb"
require "fileutils"
require "uri"

module LetterOpenerStage
  class Sms
    attr_reader :sms

    def self.rendered_sms(sms, options = {})
      messages = []
      messages << new(sms, options)
      messages.each(&:render)
      messages.sort
    end

    ERROR_MSG = '%s or default configuration must be given'.freeze

    def initialize(sms, options = {})
      @sms = sms
      @location = options[:sms_location] || File.join(LetterOpenerStage.configuration.sms_location, "#{Time.now.to_f.to_s.tr('.', '_')}")
      @template = options[:sms_template] || LetterOpenerStage.configuration.sms_template

      raise ArgumentError, ERROR_MSG % 'options[:sms_location]' unless @location
      raise ArgumentError, ERROR_MSG % 'options[:sms_template]' unless @template
    end

    def render
      FileUtils.mkdir_p(@location)

      File.open(filepath, 'w') do |f|
        f.write ERB.new(template).result(binding)
      end
    end

    def template
      File.read(File.expand_path("../templates/#{@template}.html.erb", __FILE__))
    end

    def type
      'plain'
      #content_type =~ /html/ ? "rich" : "plain"
    end

    def encoding
      'utf-8'
    end

    def filepath
      File.join(@location, "#{type}.html")
    end

    def body
      @body ||= begin
        body = @sms[:body]
        body
      end
    end

    def from
      @from ||= Array(@sms[:from]).join(", ")
    end

    def to
      @to ||= Array(@sms[:to]).join(", ")
    end

    def h(content)
      CGI.escapeHTML(content)
    end

    def <=>(other)
      order = %w[rich plain]
      order.index(type) <=> order.index(other.type)
    end
  end
end

require "letter_opener_stage/engine"

module LetterOpenerStage
  autoload :Message, "letter_opener_stage/message"
  autoload :DeliveryMethod, "letter_opener_stage/delivery_method"
  autoload :Configuration, "letter_opener_stage/configuration"

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.letters_location
    Rails.root.join("tmp", "letter_opener_stage")
  end

  def self.on_file_system
    if cannot_write_to_file_system?
      FakeFS { yield }
    else
      yield
    end
  end

  def self.cannot_write_to_file_system!
    require 'fakefs/safe'
    @cannot_write_to_file_system = true
  end

  def self.cannot_write_to_file_system?
    @cannot_write_to_file_system
  end
end

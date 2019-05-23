require "letter_opener_stage/engine"

module LetterOpenerStage
  autoload :Message, "letter_opener_stage/message"
  autoload :Sms, "letter_opener_stage/sms"
  autoload :DeliveryMethod, "letter_opener_stage/delivery_method"
  autoload :Configuration, "letter_opener_stage/configuration"

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.letters_message_location
    LetterOpenerStage.configuration.location
  end

  def self.letters_sms_location
    LetterOpenerStage.configuration.sms_location
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

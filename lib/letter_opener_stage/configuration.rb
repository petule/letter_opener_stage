module LetterOpenerStage
  class Configuration
    attr_accessor :location, :message_template, :skip_actions, :sms_location, :sms_template

    def initialize
      @location = Rails.root.join('tmp', 'letter_opener_stage', 'message') if defined?(Rails) && Rails.respond_to?(:root)
      @message_template = 'default'
      @sms_location = Rails.root.join('tmp', 'letter_opener_stage', 'sms') if defined?(Rails) && Rails.respond_to?(:root)
      @sms_template = 'sms_default'
      if defined?(LETTER_OPENER_STAGE_OPTIONS) && LETTER_OPENER_STAGE_OPTIONS.key?(:skip_actions)
        @skip_actions = LETTER_OPENER_STAGE_OPTIONS[:skip_actions]
      else
        default_options
      end
    end

    def default_options
      @skip_actions = []
    end
  end
end

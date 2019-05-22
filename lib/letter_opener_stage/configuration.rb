module LetterOpenerStage
  class Configuration
    attr_accessor :location, :message_template, :skip_actions

    def initialize
      @location = Rails.root.join('tmp', 'letter_opener_stage') if defined?(Rails) && Rails.respond_to?(:root)
      @message_template = 'default'
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

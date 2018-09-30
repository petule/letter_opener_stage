module LetterOpenerStage
  class Engine < Rails::Engine
    config.assets.paths << File.expand_path("../../assets/stylesheets", __FILE__)
    config.assets.paths << File.expand_path("../../assets/javascripts", __FILE__)
    config.assets.precompile += %w( letters.scss letter_opener_stage/letter.svg )

    initializer "letter_opener_stage.add_delivery_method" do
      ActiveSupport.on_load :action_mailer do
        ActionMailer::Base.add_delivery_method(
            :letter_opener_stage,
            LetterOpenerStage::DeliveryMethod
        )
      end
    end
  end
end

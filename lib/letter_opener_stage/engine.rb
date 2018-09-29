module LetterOpenerStage
  class Engine < Rails::Engine
    #initializer "letter_opener_stage.add_delivery_method" do
    #  ActionMailer::Base.add_delivery_method :letter_opener_stage, LetterOpenerStage::DeliveryMethod,
    #                                         location: LetterOpenerStage.letters_location
    #end
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

= Letter Opener Stage {<img src="https://secure.travis-ci.org/ryanb/letter_opener.png" />}[http://travis-ci.org/ryanb/letter_opener]

Preview email in the default browser instead of sending it. This means you do not need to set up email delivery in your development environment, and you no longer need to worry about accidentally sending a test email to someone else's address.

== Rails Setup

First add the gem to your development environment and run the +bundle+ command to install it.

  gem "letter_opener_stage", :group => :development

Then set the delivery method in <tt>config/environments/development.rb</tt>

  config.action_mailer.delivery_method = :letter_opener_stage
  config.action_mailer.perform_deliveries = true

==== Configuration

  LetterOpenerStage.configure do |config|
    # To overrider the location for message storage.
    # Default value is <tt>tmp/letter_opener_stage</tt>
    config.location = Rails.root.join('tmp', 'my_mails')

    # To render only the message body, without any metadata or extra containers or styling.
    # Default value is <tt>:default</tt> that renders styled message with showing useful metadata.
    config.message_template = :light
  end

== Development & Feedback

Questions or problems? Please use the {issue tracker}[https://github.com/ryanb/letter_opener/issues]. If you would like to contribute to this project, fork this repository and run +bundle+ and +rake+ to run the tests. Pull requests appreciated.

Special thanks to the {mail_view}[https://github.com/37signals/mail_view/] gem for inspiring this project and for their mail template. Also thanks to {Vasiliy Ermolovich}[https://github.com/nashby] for helping manage this project.
# letter_opener_stage

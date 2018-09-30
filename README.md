# Letter Opener Stage

Preview email in the default browser instead of sending it. This means you do not need to set up email delivery in your development environment, and you no longer need to worry about accidentally sending a test email to someone else's address.

## Installation

Add this to your Gemfile:

```ruby
gem "letter_opener_stage", group: :development, git: 'git@github.com:petule/letter_opener_stage.git'
```

and run `bundle install`.

Then set the delivery method in <tt>config/environments/development.rb</tt>

```config/environments/development.rb
  config.action_mailer.delivery_method = :letter_opener_stage
  config.action_mailer.perform_deliveries = true
```  

## Usage

In your `application.css`, include the css file:

```css
/*
 *= require letters
 */
```

###inbox link
In your `*html*`, include the helper link:

```*html*
<%= inbox_link if Rails.env.development? %>
```

Then restart your webserver if it was previously running.


##Configuration

  LetterOpenerStage.configure do |config|
    # To overrider the location for message storage.
    # Default value is <tt>tmp/letter_opener_stage</tt>
    config.location = Rails.root.join('tmp', 'my_mails')

    # To render only the message body, without any metadata or extra containers or styling.
    # Default value is <tt>:default</tt> that renders styled message with showing useful metadata.
    config.message_template = :light
  end


## Development

Questions or problems? Please use the {issue tracker}[https://github.com/petule/letter_opener_stage/issues]. If you would like to contribute to this project, fork this repository and run +bundle+ and +rake+ to run the tests. Pull requests appreciated.

Special thanks to the [http://github.com/ryanb/letter_opener] gem for inspiring this project.

Special thanks to the {mail_view}[https://github.com/37signals/mail_view/] gem for inspiring this project and for their mail template. Also thanks to {Vasiliy Ermolovich}[https://github.com/nashby] for helping manage this project.


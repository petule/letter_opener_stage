$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "letter_opener_stage/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "letter_opener_stage"
  s.version     = LetterOpenerStage::VERSION
  s.authors     = ["Ryan Bates"]
  s.email       = ["ryan@railscasts.com"]
  s.homepage    = "http://github.com/ryanb/letter_opener"
  s.summary     = "Preview mail in browser instead of sending."
  s.description = "When mail is sent from your application, Letter Opener Stage will save email to tmp a preview in the app instead of sending."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0"

  s.add_development_dependency "activerecord-jdbcsqlite3-adapter"
end

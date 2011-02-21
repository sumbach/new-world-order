gem "cucumber-rails",     "0.3.2",  :group => [:test]
gem "capybara",                     :group => [:test]
gem "database_cleaner",             :group => [:test]

rvm_run "bundle install"
rvm_run "./script/rails generate cucumber:install --rspec --capybara"

file "features/support/factory_girl.rb", <<-CODE
require 'factory_girl'
require 'factory_girl/step_definitions'
Dir[File.expand_path(File.join(File.dirname(__FILE__),'..','..','spec','factories','*.rb'))].each {|f| require f}
CODE

git :add => "."
git :commit => "-a -m 'Cucumber generated'"

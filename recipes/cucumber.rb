gem "cucumber-rails",     "0.3.2",  :group => [:test]
gem "capybara",                     :group => [:test]
gem "database_cleaner",             :group => [:test]

rvm_run "bundle install"
rvm_run "./script/rails generate cucumber:install --rspec --capybara"

git :add => "."
git :commit => "-a -m 'Cucumber generated'"

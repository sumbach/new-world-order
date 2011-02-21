git :rm => "-rf test"
run "rm -rf test"

gem "rspec",              "~> 2.0", :group => [:development, :test]
gem "rspec-rails",        "~> 2.0", :group => [:development, :test]
gem "factory_girl_rails", "1.0",    :group => [:development, :test], :require => nil
gem "mocha",                        :group => [:development, :test]
gem "test-unit",                    :group => [:development, :test]

rvm_run "bundle install"
rvm_run "./script/rails generate rspec:install"

gsub_file "spec/spec_helper.rb", /# (config.mock_with :mocha)/,   '\1'
gsub_file "spec/spec_helper.rb",   /(config.mock_with :rspec)/, '# \1'

initializer "rspec.rb", <<-CODE
Rails.application.config.generators.test_framework :rspec, :fixture => false
CODE
file "spec/support/focused.rb", <<-CODE
RSpec.configure do |config|
  # Configure RSpec to run focused specs, and also respect the alias 'fit' for focused specs
  config.filter_run :focused => true
  config.run_all_when_everything_filtered = true
  config.alias_example_to :fit, :focused => true
end
CODE
file "spec/support/color.rb", <<-CODE
RSpec.configure do |config|
  # Turn color on if we are NOT inside Textmate, Emacs, or VIM
  config.color_enabled = ENV.keys.none? { |k| %w{TM_MODE EMACS VIM}.include? k }
end
CODE
file "spec/support/factory_girl.rb", <<-CODE
require 'factory_girl_rails'
CODE

git :add => "."
git :commit => "-a -m 'Replace Test::Unit with Rspec'"

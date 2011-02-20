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

inject_into_file "spec/spec_helper.rb", :after => /RSpec\.configure.*\n/ do
  <<-CODE
  # Configure RSpec to run focused specs, and also respect the alias 'fit' for focused specs
  config.filter_run :focused => true
  config.run_all_when_everything_filtered = true
  config.alias_example_to :fit, :focused => true

  # Turn color on if we are NOT inside Textmate, Emacs, or VIM
  config.color_enabled = ENV.keys.none? { |k| %w{TM_MODE EMACS VIM}.include? k }

  CODE
end
inject_into_file "config/application.rb", :after => /config\.generators.*\n/ do
  <<-CODE
      g.test_framework  :rspec, :fixture => false
  CODE
end

git :add => "."
git :commit => "-a -m 'Replace Test::Unit with Rspec'"

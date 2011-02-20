append_file ".gitignore", "vendor/bundler_gems\n"

remove_file "Gemfile"
create_file "Gemfile"
add_source "http://rubygems.org"
gem "rails", "3.0.4"
gem gem_for_database unless options[:skip_activerecord]

file ".rvmrc", "rvm use #{RVM_RUBY}@#{RVM_GEMSET}\n"

run "rvm #{RVM_RUBY} gemset create #{RVM_GEMSET}"
rvm_run "gem install bundler"
rvm_run "bundle install"

git :add => "."
git :commit => "-a -m  'Initial gems setup'"

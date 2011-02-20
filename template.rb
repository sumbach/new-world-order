# constants
RVM_RUBY = "ruby-1.9.2"
RVM_GEMSET = app_name

def rvm_run(command, config = {})
  run "rvm #{RVM_RUBY}@#{RVM_GEMSET} exec #{command}", config
end

recipes = %w{
  initial_commit
  readme
  database_yml
  postgres_user
  gem_setup
  rspec
  cucumber
  jquery
  css
  db_create_migrate
}

recipes.each do |recipe|
  recipe_filename = File.join File.dirname(__FILE__), "recipes", "#{recipe}.rb"
  apply recipe_filename
end

say "All done!  Thanks for installing using the NEW WORLD ORDER"

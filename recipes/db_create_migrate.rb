rvm_run "rake db:create:all db:migrate"

git :add => "."
git :commit => "-a -m  'Create and migrate database'"

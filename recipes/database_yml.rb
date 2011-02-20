append_file ".gitignore", "config/database.yml\n"
run "cp config/database.yml config/database.example.yml"
git :rm => "config/database.yml"
git :add => "."
git :commit => "-a -m 'Move database.yml to database.example.yml'"

# symlink database.yml to database.example.yml for use by subsequent recipes
run "ln -nfs database.example.yml config/database.yml"

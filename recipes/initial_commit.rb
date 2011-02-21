git :init
remove_file "public/index.html"
remove_file "public/images/rails.png"
create_file "public/images/.gitkeep"
create_file "public/javascripts/.gitkeep"
create_file "public/stylesheets/.gitkeep"

git :add => "."
git :commit => "-a -m 'Initial commit'"

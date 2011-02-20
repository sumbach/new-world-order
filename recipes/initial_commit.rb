git :init
remove_file "public/index.html"
remove_file "public/images/rails.png"
create_file "public/images/.gitkeep"
create_file "public/javascripts/.gitkeep"
create_file "public/stylesheets/.gitkeep"

inject_into_file "config/application.rb", :after => /config\.filter_parameters.*\n/ do
  <<-CODE

    # Configure generators values. Many other options are available, be sure to check the documentation.
    config.generators do |g|
    end

  CODE
end

git :add => "."
git :commit => "-a -m 'Initial commit'"

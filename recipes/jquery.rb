# remove Prototype and script.aculo.us defaults
remove_file "public/javascripts/controls.js"
remove_file "public/javascripts/dragdrop.js"
remove_file "public/javascripts/effects.js"
remove_file "public/javascripts/prototype.js"

# install jQuery and jQuery UI
get "http://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.js",          "public/javascripts/jquery.js"
get "http://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js",      "public/javascripts/jquery.min.js"
get "http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.js",     "public/javascripts/jquery-ui.js"
get "http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js", "public/javascripts/jquery-ui.min.js"

# replace rails.js
remove_file "public/javascripts/rails.js"
get "https://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"

gsub_file "config/application.rb", /# (config\.action_view\.javascript_expansions\[:defaults\]).*$/, '\1 = %w(jquery.min jquery-ui.min rails)'

git :add => "."
git :commit => "-a -m 'Replace Prototype and script.aculo.us with jQuery and jQuery UI'"

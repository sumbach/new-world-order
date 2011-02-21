# remove Prototype and script.aculo.us defaults
remove_file "public/javascripts/controls.js"
remove_file "public/javascripts/dragdrop.js"
remove_file "public/javascripts/effects.js"
remove_file "public/javascripts/prototype.js"

# install jQuery and jQuery UI
get "http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js",      "public/javascripts/jquery.min.js"
get "http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js", "public/javascripts/jquery-ui.min.js"

git :add => "."
git :commit => "-a -m 'Replace Prototype and script.aculo.us with jQuery and jQuery UI'"

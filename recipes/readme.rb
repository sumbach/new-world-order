remove_file "README"
remove_file "doc/README_FOR_APP"

file "README.markdown", <<-README
# Welcome to #{app_name}

## Summary

#{app_name} is a .... TODO high level summary of app

## Getting Started

    gem install bundler
    bundle install
    # TODO other setup commands here

## Seed Data

Login as .... TODO insert typical test accounts for QA / devs to login to app as
README

git :add => "."
git :commit => "-a -m 'Add a README template'"

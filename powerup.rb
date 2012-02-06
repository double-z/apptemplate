# rails new appname -m https://raw.github.com/amaabca/apptemplate/master/powerup.rb

# powerup.rb
run "rm public/index.html"
run "rm app/assets/images/rails.png"
inject_into_file 'config/application.rb', :before => "  end" do
  "\n    config.time_zone = 'Mountain Time (US & Canada)'\n\n"
end

git :init
git :add => "."
git :commit => "-a -m 'Initial commit, via template generator'"

# COULD BE COOL?:
# => Zurb Foundation gem by default?
# => adding .erb to the end of generated .scss files
# => a billion cats
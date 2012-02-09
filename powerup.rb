# rails new appname --skip-bundle -T -m https://raw.github.com/amaabca/apptemplate/master/powerup.rb

def say_wizard(tag = "wizard", text); say "\033[1m\033[36m" + tag.to_s.rjust(10) + "\033[0m" + "  #{text}" end
@after_bundler_blocks = []
def after_bundler(&block); @after_bundler_blocks << block; end

# powerup.rb
run "rm public/index.html"
run "rm app/assets/images/rails.png"
inject_into_file 'config/application.rb', :before => "  end" do
  "\n    config.time_zone = 'Mountain Time (US & Canada)'\n\n"
end

after_bundler do
  git :init
  git :add => "."
  git :commit => "-a -m 'Initial commit, via template generator'"
end

say_wizard "Running Bundler install. This will take a while."
run 'bundle install'
say_wizard "Running after Bundler callbacks."
@after_bundler_blocks.each { |blk| blk.call }

# COULD BE COOL?:
# => Zurb Foundation gem by default?
# => adding .erb to the end of generated .scss files
# => a billion cats

require File.expand_path('../boot', __FILE__)

require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WomenVRP

  class Application < Rails::Application

  	config.assets.initialize_on_precompile = false
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')
	config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/

	initializer 'setup_asset_pipeline', :group => :all  do |app|
  # We don't want the default of everything that isn't js or css, because it pulls too many things in
  app.config.assets.precompile.shift

  # Explicitly register the extensions we are interested in compiling
  app.config.assets.precompile.push(Proc.new do |path|
    File.extname(path).in? [
      '.html', '.erb', '.haml',                 # Templates
      '.png',  '.gif', '.jpg', '.jpeg',         # Images
      '.eot',  '.otf', '.svc', '.woff', '.ttf', # Fonts
    ]
  end)
end
  end
end


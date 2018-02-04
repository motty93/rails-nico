# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w( nico.js )
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# .js .css .htmlファイルはコンパイルしないようにする
precompile_target = lambda do |filename, path|
  puts filename
  path =~ /app\/assets/ && !%w(.js .css .html).include?(File.extname(filename))
end
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

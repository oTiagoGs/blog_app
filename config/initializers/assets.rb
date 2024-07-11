# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.

# app/assets
Rails.application.config.assets.precompile += %w( admins.js admins.css 
                                                  site.js site.css
                                                  admin_devise.js admin_devise.css)

# lib/assets
Rails.application.config.assets.precompile += %w( custom.js custom.css
                                                  script.js style.css 
                                                  custom_admin.css
                                                  img.jpg)

# vendor/assets
Rails.application.config.assets.precompile += %w( jquery-2.2.3/dist/jquery.js )

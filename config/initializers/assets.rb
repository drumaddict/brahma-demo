# Be sure to restart your server when you modify this file.

  Rails.application.config.assets.enabled = true
  Rails.application.config.assets.debug = true
  # Version of your assets, change this if you want to expire all your assets.
  Rails.application.config.assets.version = '2.0'

  # Bower asset paths
  Rails.application.root.join('vendor', 'app_components').to_s.tap do |bower_path|
    Rails.application.config.sass.load_paths << bower_path
    Rails.application.config.assets.paths << bower_path
  end

  Rails.application.config.assets.paths << "#{Rails.root}/app/assets/images/metronic"


  # Precompile additional assets.
  # application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
  Rails.application.config.assets.precompile += %w( search.js ie10-viewport-bug-workaround.js)
  Rails.application.config.assets.precompile += %w( ckeditor/* )


  # Precompile Bootstrap fonts
  Rails.application.config.assets.precompile << %r(bootstrap-sass-official/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff)$)
  # Minimum Sass number precision required by bootstrap-sass
  ::Sass::Script::Number.precision = [10, ::Sass::Script::Number.precision].max








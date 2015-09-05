source 'https://rubygems.org'

brahma_from_disk= false
# if ENV["RAILS_ENV"] == "development"
#   gem 'brahma',      path: '../../Labs/brahma'
# else
#   gem 'brahma', git: 'git@bitbucket.org:drumaddict/brahma.git'
# end


if brahma_from_disk
  gem 'brahma',      path: '../../Labs/brahma'
else
  gem 'brahma', git: 'git@bitbucket.org:drumaddict/brahma.git'
end

group :development do
  gem 'pry-byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'faker'
  gem 'factory_girl'
  gem 'annotate'
  gem 'awesome_print', :require => 'ap'
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  gem "capistrano-db-tasks", require: false


end


gem 'puma'
gem 'jquery-rails'
gem 'prettyphoto-rails'
#gem 'brahma', git: 'git@bitbucket.org:drumaddict/brahma.git'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# gem 'rails', '4.2.0'
# # Use sqlite3 as the database for Active Record
# gem 'sqlite3'

# gem 'mysql2'
# # Use SCSS for stylesheets
# gem 'sass-rails', '~> 4.0.3'
# # Use Uglifier as compressor for JavaScript assets
# gem 'uglifier', '>= 1.3.0'
# # Use CoffeeScript for .js.coffee assets and views
# gem 'coffee-rails', '~> 4.0.0'
# # See https://github.com/sstephenson/execjs#readme for more supported runtimes
# # gem 'therubyracer',  platforms: :ruby

# # Use jquery as the JavaScript library
# gem 'jquery-rails'
# # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'
# # bundle exec rake doc:rails generates the API under doc/api.
# gem 'sdoc', '~> 0.4.0',          group: :doc
# gem 'kaminari'
# gem 'haml'
# gem 'friendly_id', '5.1.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:x64_mingw,:mingw, :mswin]
gem 'tzinfo'

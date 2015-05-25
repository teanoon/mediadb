source 'https://ruby.taobao.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use mysql as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

gem "haml-rails"
gem 'twitter-bootstrap-rails'       # for demo only
gem "compass-rails"
gem 'font-awesome-rails'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'
gem 'kaminari'
gem 'simple_form'
gem 'rails_admin'
gem 'carrierwave'
gem 'mechanize'

group :production do
  gem 'rails_12factor'
  gem 'puma'
end

group :development do
  gem 'zeus'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-puma'
  # gem 'capistrano-sidekiq'
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-zeus'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'guard-sidekiq'
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'pry-rails'
end

group :test do
  gem 'rspec-rails'
  # gem 'rspec-sidekiq'
  gem 'database_cleaner'
  gem 'cucumber-rails', require: false
  gem "factory_girl_rails"
  gem 'vcr'
  gem 'webmock'
end
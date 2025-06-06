source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.3'

gem 'rails', '~> 8.0.2'
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
# gem 'sass-rails', '>= 6'

# Modern asset pipeline (Node-free approach)
gem 'propshaft'
gem 'importmap-rails'
gem "turbo-rails"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

gem "combined_time_select", "~> 2.0.0"

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'omniauth-google-oauth2'
gem 'dotenv-rails'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

group :development, :test do
  gem 'pry'
  gem 'faker'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'nyc_neighborhoods'

gem 'aws-sdk-s3', require: false

gem 'devise'

gem "after_party", "~> 2.0"

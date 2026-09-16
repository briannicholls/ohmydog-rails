source "https://rubygems.org"

ruby "3.4.10"

gem "rails", "~> 8.1.3"
gem "pg"
gem "puma", ">= 5.0"
gem "propshaft"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
# Rails 8.1.3.1 cookie decoding is incompatible with json 3.x.
gem "json", "~> 2.13"

gem "combined_time_select", "~> 2.0.0"

gem "omniauth-google-oauth2"
gem "omniauth-rails_csrf_protection"
gem "dotenv-rails"

gem "bootsnap", require: false

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "nyc_neighborhoods"

gem "aws-sdk-s3", require: false

gem "devise"

gem "after_party", "~> 2.0"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "bundler-audit", require: false
  gem "brakeman", require: false
  gem "pry"
  gem "faker"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

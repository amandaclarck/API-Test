# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"

gem "rails", "~> 6.0.3", ">= 6.0.3.2"
gem "puma", "~> 4.1"
gem "uglifier", ">= 1.3.0"
gem "jbuilder", "~> 2.7"
gem "bootsnap", ">= 1.4.2", require: false
gem "pg"
gem "zeitwerk"
gem "awesome_print"
gem "http-cookie"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "pry"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "dotenv-rails"
  gem "shoulda-matchers"
  gem "webmock"
  gem "standardrb"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "selenium-webdriver"
  gem "rack-test"
end

group :production do
  gem "newrelic_rpm"
  gem "rollbar"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Gemfile
# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'actionview', '5.2.8.1'
gem 'activerecord', '5.2.8.1'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'coffee-rails', '~> 4.2'
gem 'duktape'
gem 'jbuilder', '~> 2.9'
gem 'mini_portile2', '2.8.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'rails', '5.2.8.1'
gem 'rubocop', require: false
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 4.2.0'

gem 'factory_bot', '6.4.2'
gem 'factory_bot_rails'

group :development do
  gem 'shoulda-matchers', '~> 4.5'
  gem 'web-console', '>= 3.0', '< 5.0'
end

group :development, :test do
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 5.0.0'
end

group :test do
  gem 'capybara', '>= 3.26'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

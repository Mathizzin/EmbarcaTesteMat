# frozen_string_literal: true

# config/application.rb

require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module SuaApp
  # Application configuration class.
  class Application < Rails::Application
    config.load_defaults 5.2
  end
end

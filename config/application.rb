require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require 'rack/attack'
require "rails-i18n"
require 'http_errors'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GithubSearchEngine
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # This configuration allows [CORS](poe://www.poe.com/_api/key_phrase?phrase=CORS&prompt=Tell%20me%20more%20about%20CORS.) for all origins and all [HTTP methods](poe://www.poe.com/_api/key_phrase?phrase=HTTP%20methods&prompt=Tell%20me%20more%20about%20HTTP%20methods.).
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
      end
    end

    config.middleware.use Rack::Attack

    # Use FactoryBot for fixture replacement
    config.generators do |g|
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end

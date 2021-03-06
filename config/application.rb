# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.

    # Twitter access configuration
    config.twitter_consumer_key = ENV["TWITTER_CONSUMER_KEY"]
    config.twitter_consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
    config.twitter_access_token = ENV["TWITTER_ACCESS_TOKEN"]
    config.twitter_access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]

    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.i18n.available_locales = ["pt-BR"]
    config.i18n.default_locale = "pt-BR"
  end
end

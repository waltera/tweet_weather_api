# frozen_string_literal: true

WalterWeather::Config::Service.configure do |config|
  config.app_key = ENV["OPEN_WEATHER_API_KEY"]
end

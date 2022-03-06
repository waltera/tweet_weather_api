class TweetService
  include ActiveModel::Model

  attr_accessor :city_id

  def perform!
    result = WalterWeather.weather_from_city(city_id)
    tweet_weather = TweetWeather.new(result:)
    tweet_weather.build_text

    client.update(tweet_weather.text)

    true
  end

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.configuration.twitter_consumer_key
      config.consumer_secret = Rails.configuration.twitter_consumer_secret
      config.access_token = Rails.configuration.twitter_access_token
      config.access_token_secret = Rails.configuration.twitter_access_token_secret
    end
  end
end
# frozen_string_literal: true

# Handle logic to mount tweet text with WalterWeather Result

class TweetWeather
  include ActiveModel::Model
  include ActionView::Helpers::NumberHelper\

  attr_accessor :result

  attr_reader :text

  def build_text
    @text = [weather_text, forecast_text].join(" ")
  end

  def weather_text
    I18n.t(
      "activemodel.tweet_weather.weather_text",
      temp: number_to_human(result.weather.temp),
      description: result.weather.description,
      city_name: result.weather.city_name,
      date: I18n.l(result.weather.date.to_date, format: :short)
    )
  end

  def forecast_text
    texts = result.forecasts.map do |weather|
      I18n.t(
        "activemodel.tweet_weather.forecast_raw",
        temp: number_to_human(weather.temp),
        date: I18n.l(weather.date.to_date, format: :short)
      )
    end

    I18n.t("activemodel.tweet_weather.forecast_text", text: texts.to_sentence)
  end
end

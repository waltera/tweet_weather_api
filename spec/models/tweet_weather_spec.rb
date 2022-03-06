# frozen_string_literal: true

require "rails_helper"

RSpec.describe TweetWeather, type: :model do
  describe "#build_text" do
    subject { described_class.new(result: weather_result).build_text }

    let!(:weather_one) do
      WalterWeather::Models::Weather.new(
        temp: 10,
        description: "nublado",
        city_name: "Brasília",
        date: Time.zone.local(2022, 1, 1, 10)
      )
    end
    let!(:weather_two) do
      WalterWeather::Models::Weather.new(
        temp: 11,
        description: "Test two",
        city_name: "Brasília",
        date: Time.zone.local(2022, 1, 2, 10)
      )
    end
    let!(:weather_three) do
      WalterWeather::Models::Weather.new(
        temp: 12,
        description: "Test three",
        city_name: "Brasília",
        date: Time.zone.local(2022, 1, 3, 10)
      )
    end
    let!(:weather_four) do
      WalterWeather::Models::Weather.new(
        temp: 13,
        description: "Test four",
        city_name: "Brasília",
        date: Time.zone.local(2022, 1, 4, 10)
      )
    end
    let!(:weather_result) do
      WalterWeather::Models::Result.new(
        weather: weather_one,
        forecasts: [weather_two, weather_three, weather_four]
      )
    end
    let!(:expected_result) do
      "10°C e nublado em Brasília em 01/01. Média para os próximos dias: 11°C em 02/01," \
      " 12°C em 03/01 e 13°C em 04/01."
    end

    it { is_expected.to eq(expected_result) }
  end
end

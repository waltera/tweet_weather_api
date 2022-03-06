require 'rails_helper'

RSpec.describe 'Tweet Weather Management', type: :request do
  describe '#post' do
    let!(:params) { { city_id: 3469058 } }
    let!(:expected_text) { "10°C e nublado em Brasília em 01/01. Média para os próximos dias: 10°C em 01/01." }
    let!(:weather) do
      WalterWeather::Models::Weather.new(
        temp: 10,
        description: 'nublado',
        city_name: 'Brasília',
        date: Time.new(2022, 1, 1, 10)
      )
    end
    let!(:result) { WalterWeather::Models::Result.new(weather:, forecasts: [weather]) }

    it 'must call WalterWather and tweet' do
      expect(WalterWeather).to receive(:weather_from_city).with("3469058").and_return(result)
      expect_any_instance_of(Twitter::REST::Client).to receive(:update).with(expected_text)
      post('/tweet_weather', params:)
    end
  end
end
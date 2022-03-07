# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Tweet Weather Management", type: :request do
  describe "#post" do
    context 'with success' do
      let!(:params) { { city_id: "3469058" } }
      let!(:expected_text) { "10°C e nublado em Brasília em 01/01. Média para os próximos dias: 10°C em 01/01." }
      let!(:weather) do
        WalterWeather::Models::Weather.new(
          temp: 10,
          description: "nublado",
          city_name: "Brasília",
          date: Time.zone.local(2022, 1, 1, 10)
        )
      end
      let!(:result) { WalterWeather::Models::Result.new(weather:, forecasts: [weather]) }
      let!(:client_dbl) { instance_double("Twitter::REST::Client", update: true) }

      it "must call WalterWather and tweet" do
        expect(WalterWeather).to receive(:weather_from_city).with("3469058").and_return(result)

        expect(Twitter::REST::Client).to receive(:new).and_return(client_dbl)
        expect(client_dbl).to receive(:update).with(expected_text)

        post("/tweet_weather", params:)
      end
    end

    context 'with fail' do
      let!(:service_dbl) { instance_double("TweetService") }

      it "must return unprocessabled entity code" do
        expect(TweetService).to receive(:new).and_return(service_dbl)
        expect(service_dbl).to receive(:perform!).and_raise

        post("/tweet_weather", params: {})

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

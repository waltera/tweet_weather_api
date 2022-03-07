# frozen_string_literal: true

class TweetWeatherController < ApplicationController
  def create
    begin
      service = TweetService.new(tweet_params)
      service.perform!
      head :created
    rescue
      head :unprocessable_entity
    end
  end

  private

  def tweet_params
    params.permit(:city_id)
  end
end

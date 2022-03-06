# frozen_string_literal: true

class TweetWeatherController < ApplicationController
  def create
    service = TweetService.new(tweet_params)
    service.perform!
    head :created
  end

  private

  def tweet_params
    params.permit(:city_id)
  end
end

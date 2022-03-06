class TweetWeatherController < ApplicationController
  def create
    service = TweetService.new(tweet_params)

    if service.perform!
      head :created
    else
      head :unprocessable_entity
    end
  end

  private

  def tweet_params
    params.permit(:city_id)
  end
end
# Tweet Weather API

Expose API with single endpoint to create tweets with weather information

## Usage

### Set environment variables
Use `.env` to set variables:

    # Tweeter credentials
    TWITTER_CONSUMER_KEY=YOUR_TWITTER_CONSUMER_KEY
    TWITTER_CONSUMER_SECRET=YOUR_TWITTER_CONSUMER_SECRET
    TWITTER_ACCESS_TOKEN=YOUR_TWITTER_ACCESS_TOKEN
    TWITTER_ACCESS_TOKEN_SECRET=YOUR_TWITTER_ACCESS_TOKEN_SECRET

    # Open Weather API Token
    OPEN_WEATHER_API_KEY=YOUR_OPEN_WEATHER_API_KEY

### Without Docker

First install Ruby 3.1.1

Install gem dependencies:

    $ bundle install

Run puma:

    $ rails s

### With Docker

Build image:

    $ docker-compose build

Install gem dependencies:

    $ docker-compose run web bundle install

Run web container:

    $ docker-compose up

## Endpoint

Exemplo:

    $ curl -d "city_id=3469058" -X POST http://localhost:3000/tweet_weather

Get `city_id` from [Geocoding API](https://openweathermap.org/api/geocoding-api) manually.
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_tweets, except: [:nytimes]

  def load_tweets
    if twitter_accessor.client
      @tweets = twitter_accessor.client.home_timeline.take(15)
    end
  end

  def nytimes
    render text: Net::HTTP.get(URI("http://api.nytimes.com/svc/topstories/v1/home.json?api-key=#{Rails.application.secrets.nyt_apiKey}"))
  end

  private

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.secrets.consumer_key
      config.consumer_secret = Rails.application.secrets.consumer_secret
      # config.access_token = Rails.application.secrets.access_token
      # config.access_token_secret = Rails.application.secrets.access_token_secret
    end
  end

  def twitter_accessor
    @twitter_accessor ||= TwitterAccessor.new(current_user)
      # config.access_token = Rails.application.secrets.access_token
      # config.access_token_secret = Rails.application.secrets.access_token_secret
  end
end

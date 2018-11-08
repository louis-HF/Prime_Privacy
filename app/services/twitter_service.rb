require 'json'
require 'open-uri'
require 'rest-client'


class TwitterService
   def initialize(user)
    @current_user = user
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API']
      config.consumer_secret     = ENV['TWITTER_SECRET_API']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_SECRET_TOKEN']
    end
  end

  def try
    options = {count: 200, include_rts: true}
    while !@client.user_timeline('pewdiepie', options).nil?
      @client.user_timeline('pewdiepie', options).each_with_index do |tweet, index|
      p tweet.media[0].media_url.to_s unless tweet.media.nil? || tweet.media.empty?
      p tweet.text
        if index == 199
          options = {count: 200, include_rts: true, max_id: tweet.id}
        end
      end
      break if @client.user_timeline('hlouis6', options).length < 200
    end
  end

end



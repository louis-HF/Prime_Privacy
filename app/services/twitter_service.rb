require 'json'
require 'open-uri'
require 'rest-client'


class TwitterService
   def initialize(user)
    @current_user = user
  end

  def try
    p JSON.parse(RestClient.get("https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=twitterapi&count=2", {'Authorization' => "Bearer #{@current_user.twitter.accesstoken}"}))
  end
end



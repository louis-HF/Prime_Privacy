require 'json'
require 'open-uri'
require 'rest-client'


class TwitterService
   def initialize(user)
    @current_user = user
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API']
      config.consumer_secret     = ENV['TWITTER_SECRET_API']
      config.access_token        = @current_user.twitter.accesstoken
      config.access_token_secret = @current_user.twitter.tokensecret
    end
  end

  def twitter
    try
    following_content
  end

  def try
    options = {count: 200, include_rts: true}
    while !@client.user_timeline(@current_user.twitter.uid, options).nil?
      @client.user_timeline(@current_user.twitter.uid, options).each_with_index do |tweet, index|
      unless tweet.media.nil? || tweet.media.empty?
        twitter_image(tweet)
      else
        twitter_post(tweet)
      end
        tweet.media[0].media_url.to_s unless tweet.media.nil? || tweet.media.empty?

      p tweet.text
        if index == 199
          options = {count: 200, include_rts: true, max_id: tweet.id}
        end
      end
      break if @client.user_timeline('hlouis6', options).length < 200
    end
  end

  def following_content
    @client.friends(@current_user.twitter.uid.to_i).each do |tweet|
      Content.create(
            user: @current_user,
            external_provider: "twitter",
            external_id: tweet.id,
            external_created_date: Date.today,
            external_edit_date: nil,
            file_type: "like",
            selected: false,
            coef_total: 0,
            text_publication: tweet.screen_name,
            url_image: nil,
            description: tweet.name,
            scan_date: Date.today,
            publication_url: nil
            )
    end
  end

  def twitter_image(tweet)
    image = tweet.media_url.to_s
    cloudinary_url = Cloudinary::Uploader.upload(image)["url"]
      Content.create(
            user: @current_user,
            external_provider: "twitter",
            external_id: tweet.id,
            external_created_date: tweet.created_at,
            external_edit_date: nil,
            file_type: "image",
            selected: false,
            coef_total: 0,
            text_publication: tweet.text,
            url_image: image,
            scan_date: Date.today,
            publication_url: nil ,
            cloudinary_url: cloudinary_url
            )
  end

  def twitter_post(tweet)
      Content.create(
            user: @current_user,
            external_provider: "twitter",
            external_id: tweet.id,
            external_created_date: tweet.created_at,
            external_edit_date: nil,
            file_type: "post",
            selected: false,
            coef_total: 0,
            text_publication: tweet.text,
            url_image:nil,
            scan_date: Date.today,
            publication_url: nil ,
            cloudinary_url: nil
            )
  end
end



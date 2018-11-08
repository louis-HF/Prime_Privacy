class TwitterDelete
  def initialize(user)
    @current_user = user
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API']
      config.consumer_secret     = ENV['TWITTER_SECRET_API']
      config.access_token        = @current_user.twitter.accesstoken
      config.access_token_secret = @current_user.twitter.tokensecret
    end
  end

  def delete
    delete_posts_and_media
    delete_follow
  end

  def delete_posts_and_media
    @content_post = Content.where(selected: true, provider: "twitter", file_type: "post")
    @content_image= Content.where(selected: true, provider: "twitter", file_type: "image")
    @content_post.each do |content|
      @client.destroy_status(content.external_id)
    end
    @content_image.each do |content|
      @client.destroy_status(content.external_id)
    end
  end

  def delete_follow
    @content_follow = Content.where(selected: true, provider: "twitter", file_type: "like")
    @content_follow.each do |content|
      @client.friendships.unfollow(content.external_id)
    end
  end
end

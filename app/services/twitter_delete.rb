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
    redirect_to :back
  end

  def delete_posts_and_media
    @content_post = Content.where(selected: true, external_provider: "twitter", file_type: "post", user: @current_user)
    @content_image= Content.where(selected: true, external_provider: "twitter", file_type: "image", user: @current_user)
    unless @content_post.empty?
      @content_post.each do |content|
        unless content.deleted == true
          @client.destroy_status(content.external_id)
          content.deleted = true
          content.save
        end
      end
    end
    unless @content_image.empty?
      @content_image.each do |content|
        unless content.deleted == true
          @client.destroy_status(content.external_id)
          content.deleted = true
          content.save
        end
      end
    end
  end

  def delete_follow
    @content_follow = Content.where(selected: true, external_provider: "twitter", file_type: "like", user: @current_user)
    unless @content_follow.empty?
      @content_follow.each do |content|
        unless content.deleted == true
          @client.unfollow(content.external_id.to_i)
          content.deleted = true
          content.save
        end
      end
    end
  end
end

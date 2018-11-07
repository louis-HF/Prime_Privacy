class StatisticService
  def initialize(user)
    @current_user = user
  end

  def compute_userstat
    Userstatistic.create(
      user: @current_user,
      date: Date.today,
      fb_photo_public: Content.where("user_id = ? AND external_provider = ? AND scan_date = ? AND file_type = ?", @current_user.id, "facebook", Date.today, "image").count,
      fb_photo_public_sensitive: Content.where("user_id = ? AND external_provider = ? AND scan_date = ? AND file_type = ? AND coef_total > ?", @current_user.id, "facebook", Date.today, "image", 0).count,
      fb_post_public: Content.where("user_id = ? AND external_provider = ? AND scan_date = ? AND file_type = ?", @current_user.id, "facebook", Date.today, "post").count,
      fb_post_public_sensitive: Content.where("user_id = ? AND external_provider = ? AND scan_date = ? AND file_type = ? AND coef_total > ?", @current_user.id, "facebook", Date.today, "post", 0).count,
      fb_likes_public: Content.where("user_id = ? AND external_provider = ? AND scan_date = ? AND file_type = ?", @current_user.id, "facebook", Date.today, "like").count,
      fb_likes_public_sensitive: Content.where("user_id = ? AND external_provider = ? AND scan_date = ? AND file_type = ? AND coef_total > ?", @current_user.id, "facebook", Date.today, "like", 0).count,
      tw_photo_public: Content.where("user_id = ? AND external_provider = ? AND scan_date = ? AND file_type = ?", @current_user.id, "twitter", Date.today, "image").count,
      tw_photo_public_sensitive: Content.where("user_id = ? AND external_provider = ? AND scan_date = ? AND file_type = ? AND coef_total > ?", @current_user.id, "twitter", Date.today, "image", 0).count,
      tw_post_public: Content.where("user_id = ? AND external_provider = ? AND scan_date = ? AND file_type = ?", @current_user.id, "twitter", Date.today, "post").count,
      tw_post_public_sensitive: Content.where("user_id = ? AND external_provider = ? AND scan_date = ? AND file_type = ? AND coef_total > ?", @current_user.id, "twitter", Date.today, "post", 0).count,
      tw_likes_public: Content.where("user_id = ? AND external_provider = ? AND scan_date = ? AND file_type = ?", @current_user.id, "twitter", Date.today, "like").count,
      tw_likes_public_sensitive: Content.where("user_id = ? AND external_provider = ? AND scan_date = ? AND file_type = ? AND coef_total > ?", @current_user.id, "twitter", Date.today, "like", 0).count,
      total_fb_public: Content.where("user_id = ? AND external_provider = ? AND scan_date = ?", @current_user.id, "facebook", Date.today).count,
      total_fb_public_sensitive: Content.where("user_id = ? AND external_provider = ? AND scan_date = ? AND coef_total > ?", @current_user.id, "facebook", Date.today, 0).count,
      total_tw_public: Content.where("user_id = ? AND external_provider = ? AND scan_date = ?", @current_user.id, "twitter", Date.today).count,
      total_tw_public_sensitive: Content.where("user_id = ? AND external_provider = ? AND scan_date = ? AND coef_total > ?", @current_user.id, "twitter", Date.today, 0).count
      )
    step_topicstat(Userstatistic.last)
  end



  def step_topicstat(userstatistic)
    Topic.where(user: @current_user).each { |topic| compute_topicstat(topic, userstatistic)}
    Topic.where(user: nil). each { |topic| compute_topicstat(topic, userstatistic)}
  end

  def compute_topicstat(topic, userstatistic)
    instances = 0
    @current_user.content_keywords.each do |content_keyword|
      instances += 1 if content_keyword.keyword.topic == topic
    end
    Topicstatistic.create(
      topic: topic,
      userstatistic: userstatistic,
      numberofinstances: instances
      )
  end
end

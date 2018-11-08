class FacebookJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    TwitterService.new(user).following_content
    # FacebookService.new(user).facebook_images(Content.find(1))
    # VisionService.new(user).image_analysis
    # WordTester.new(user).find_keywords
    # StatisticService.new(user).compute_userstat
  end
end

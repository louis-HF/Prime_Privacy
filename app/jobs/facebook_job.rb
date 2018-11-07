class FacebookJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    # TwitterService.new(user).try
    FacebookService.new(user).facebook
    VisionService.new(user).image_analysis
    WordTester.new(user).find_keywords
    StatisticService.new(user).compute_userstat
  end
end

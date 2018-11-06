class FacebookJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    FacebookService.new(user).facebook
    # WordTester.new(user).find_keywords
  end
end

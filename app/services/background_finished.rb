class BackgroundFinished
  def initialize(user)
    @current_user = user
  end

  def shouldwego
    wait = true
    length = 6 + Topic.where(user: @current_user).length
    while wait
      sleep(4)
      unless Userstatistic.find_by(user: @current_user, date: Date.today).nil?
        wait = false if Userstatistic.find_by(user: @current_user, date: Date.today).topicstatistics.length == length
      end
    end
  end
end

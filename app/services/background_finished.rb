class BackgroundFinished
  def initialize(user)
    @current_user = user
  end

  def shouldwego
    # length = 6 + Topic.where(user: @current_user).length
    # unless Userstatistic.find_by(user: @current_user, date: Date.today).nil?
    #   if Userstatistic.find_by(user: @current_user, date: Date.today).topicstatistics.length == length
    # end
    # end
    render json: [false, false, false, false, false, false, true].to_json
  end
end

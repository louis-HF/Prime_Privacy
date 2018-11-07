class BackgroundsController < ApplicationController
  skip_after_action :verify_authorized, only: [:loadingpage, :shouldwego]

  def loadingpage
    PreferenceInitializer.new(current_user).create_pref if Preference.where(user: current_user).empty?
    if Content.where(user: current_user, scan_date: Date.today).empty?
      FacebookJob.perform_later(current_user.id)
    end
  end

  def checker

  end

  def shouldwego
    length = 6 + Topic.where(user: current_user).length
    if Userstatistic.find_by(user: current_user, date: Date.today).nil?
      a = nil
    elsif Userstatistic.find_by(user: current_user, date: Date.today).topicstatistics.length == length
      a = Userstatistic.find_by(user: current_user, date: Date.today).id
    else
      a = nil
    end
    render json: a.to_json
  end

end



  # def loadingpage
  #   render 'backgrounds/loadingpage',layout: 'application'
  #   PreferenceInitializer.new(current_user).create_pref if Preference.where(user: current_user).empty?
  #   if Content.where(user: current_user, scan_date: Date.today).empty?
  #     FacebookJob.perform_later(current_user.id)
  #   end
  #   BackgroundFinished.new(current_user).shouldwego
  #   redirect_to userstatistic_path(Userstatistic.find_by(date: Date.today, user: current_user))
  # end



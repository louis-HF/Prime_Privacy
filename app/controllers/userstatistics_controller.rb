class UserstatisticsController < ApplicationController
  def index
    @userstatistics = policy_scope(Userstatistic)
    PreferenceInitializer.new(current_user).create_pref if Preference.where(user: current_user).empty?
  end

  def show
    @userstatistic = Userstatistic.find(params[:id])
    authorize @userstatistic
  end
end

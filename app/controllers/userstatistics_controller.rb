class UserstatisticsController < ApplicationController
  def index
    @userstatistics = policy_scope(Userstatistic)
  end

  def show
    @userstatistic = Userstatistic.find(params[:id])
    authorize @userstatistic
  end
end

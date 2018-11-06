class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :destroy]

  def new
    @topic = current_user.topics.new
    authorize @topic
  end

  def create
    @topic = current_user.topics.new(topic_params)
    @prefence = Preference.new(user: current_user)
    @prefence.topic = @topic
    @prefence.rank = Preference.where(user: current_user).maximum(:rank) + 1
    authorize @topic
    @topic.save
    @prefence.save
    redirect_to preferences_path
  end

  def destroy
    @topic.destroy
  end

  def update
    @topic.update(topic_params)
    @topic.save
    redirect_to preferences_path
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end

  def set_topic
    @topic = Topic.find(params[:id])
    authorize @topic
  end
end

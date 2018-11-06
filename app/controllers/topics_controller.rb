class TopicsController < ApplicationController
  before_action :topic, only: [:edit, :update, :destroy]

  def new
    @topic = current_user.topics.new
    authorize @topic
  end

  def create
    @topic = current_user.topics.new(topic_params)
    authorize @topic
  end

  def destroy
    @topic.destroy
  end

  def update
    @topic.update(topic_params)
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

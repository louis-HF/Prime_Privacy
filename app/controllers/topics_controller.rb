class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :destroy]
  before_action :set_keyword, only: [:edit, :update, :destroy]

  def new
    @topic = current_user.topics.new
    authorize @topic

    @keyword = current_user.keywords.new
    authorize @keyword
  end

  def create
    # Topic creation
    @topic = current_user.topics.new(topic_params)
    @topic.picto = "personal.png"

    # Preference creation
    @preference = Preference.new(user: current_user)
    @preference.topic = @topic
    @preference.rank = Preference.where(user: current_user).maximum(:rank) + 1

    # Keywords creation
    @keyword = current_user.keywords.new(keyword_params)

    authorize @topic
    @topic.save
    @preference.save
    @keyword.save
    redirect_to preferences_path + "#Preference_#{@preference.id}"
  end

  def destroy
    @topic.destroy
  end

  def update
    @topic.update(topic_params)
    @keyword.update(keyword_params)
    @topic.save
    @keyword.save
    redirect_to preferences_path
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end

  def keyword_params
    params.require(:keyword1).permit(:name)
  end

  def set_topic
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def set_keyword
    @keyword = Keyword.find(params[:id])
    authorize @keyword
  end
end

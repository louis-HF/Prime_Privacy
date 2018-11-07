class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :destroy]
  before_action :set_keywords, only: [:new, :edit, :update, :destroy]

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
    @keywords = params["keyword"]
    @keywords.each do |keyword|
      @keyword = Keyword.new(name: keyword, topic: @topic)
      @keyword.save
    end

    authorize @topic
    @topic.save
    @preference.save
    redirect_to preferences_path + "#Preference_#{@preference.id}"
  end

  def edit

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
    params.require(:topic).permit(:name, :keyword)
  end

  # def keyword_params
  #   params.require(:keyword).permit(:name)
  # end

  def set_topic
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def set_keywords
    @keywords = Keyword.find(params[:id])
    # authorize @keywords
  end
end

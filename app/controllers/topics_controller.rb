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
    authorize @topic
    @topic.save
    puts "CREATE: Topic is saved?"
    p @topic.errors.messages

    # Preference creation
    @preference = Preference.new(user: current_user, topic: @topic)
    @preference.rank = Preference.where(user: current_user).maximum(:rank) + 1
    @preference.save
    puts "CREATE: Preference is saved?"
    p @preference.errors.messages

    # Keywords creation
    @keywords = params["keyword"]
    @keywords.each do |keyword|
      @keyword = Keyword.new(name: keyword, topic: @topic)
      @keyword.save
      puts "CREATE: Keyword is saved?"
      p @keyword.errors.messages
    end

    redirect_to preferences_path + "#Preference_#{@preference.id}"
  end

  def edit

  end

  def destroy
    @topic.destroy
  end

  def update
    @topic.update(topic_params)
    @old_keywords = @topic.keywords
    @old_keywords.each_with_index do |old_keyword|
      old_keyword.destroy
    end
    @new_keywords = params["keyword"]
    if @new_keywords == nil
      redirect_to preferences_path
    else
      @new_keywords.each do |keyword|
        @keyword = Keyword.new(name: keyword, topic: @topic)
        @keyword.save
    end
      redirect_to preferences_path
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
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

class PreferenceInitializer

  def initialize(user)
    @current_user = user
  end

  def create_pref
    topics= ["Swearing", "Sexualy explicit",  "Alcohol and drugs", "Party", "Politics", "Religion"]
    topics.each_with_index do |topic, index|
      Preference.create(rank: index, topic: Topic.find_by(name: topic), user: @current_user)
    end
  end
end

class WordTester
  def initialize(user)
    @keywords = []
    @current_user = user
    @contents = Content.where(user: user)
  end

  def word_test
    @contents.each do |content|
      content["text_publication"].nil? ? text_publication = "" : text_publication = content["text_publication"]
      content["description"].nil? ? description = "" : description = content["description"]
      text = text_publication + " " + description
      text = text.downcase
      coef = 0
      @keywords.each do |keyword|
        if text.include?("#{keyword.name} ") || text.include?("#{keyword.name}\n") || text.include?("#{keyword.name}.") || text.include?("#{keyword.name}!") || text.include?("#{keyword.name}?")
          ContentKeyword.create(content: content, keyword: keyword)
          coef = coef + Preference.where(user: @current_user).count + 7 - Preference.find_by(topic: keyword.topic).rank
        end
      end
      content.coef_total = coef
      content.save
    end
  end

  def find_keywords
    p @current_user
    p @current_user.preferences
    @current_user.preferences.each do |preference|
      keywords = preference.topic.keywords
      keywords.each { |keyword| @keywords << keyword}
    end
    word_test
  end
end

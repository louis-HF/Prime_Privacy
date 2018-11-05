class WordTester
  def initialize(user)
    @keywords = Keyword.all
    @current_user = user
    @contents = Content.where(user: user)
  end

  def word_test
    @contents.each do |content|
      content["text_publication"].nil? ? text_publication = "" : text_publication = content["text_publication"]
      content["description"].nil? ? description = "" : description = content["description"]
      text = text_publication + description
      text = text.downcase
      coef = 0
      @keywords.each do |keyword|
        if text.include?(keyword.name)
          ContentKeyword.create(content: @content, keyword: keyword)
          coef = coef + Preference.where(user: @current_user) + 7 - Preference.find_by(topic: Keyword.find(1).topic).rank
        end
      end
      content.coef_total = coef
      content.save
    end
  end
end

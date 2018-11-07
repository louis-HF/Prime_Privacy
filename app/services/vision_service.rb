require 'json'
require 'open-uri'
require 'rest-client'
require "google/cloud/vision"
require 'json'

class VisionService
  def initialize(user)
    @key = ENV['GOOGLE_VISION_API_KEY']
    @current_user = user
    @photo_url = photo_url
    @contents = Content.where(user: @current_user, file_type: "image")
  end

  def image_analysis
    if !@contents.nil?
      @contents.each do |content|
        call(content)
      end
    end
  end

  def call(content)
    url = 'https://vision.googleapis.com/v1/images:annotate?key=' + @key
    keywords = ''
    payload = {
      requests: [
        {
          image: {
            source: {
              imageUri: content.cloudinary_url
            }
          },
          features: [
            {
              type: "LABEL_DETECTION",
              maxResults: 15
            }
          ]
        }
      ]
    }
    JSON.parse(RestClient.post(url, payload.to_json, content_type: 'application/json'))["responses"][0]["labelAnnotations"].each do |element|
      keywords = keywords + " " + element["description"]
    end
    keywords
  end
end

# response = VisionService.new("https://static.vinepair.com/wp-content/uploads/2017/07/beer-dogs-inside.jpg").call
# response[0]["localizedObjectAnnotations"].each do |e|
#   puts e['name']
# end



    # content['description'] = keywords
    # content.save
    # p keywords

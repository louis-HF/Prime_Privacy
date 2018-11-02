require 'json'
require 'open-uri'

class FacebookContentJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    url = "https://graph.facebook.com/v3.2/#{user.facebook.uid}/feed?fields=picture,id,created_time,updated_time,message,permalink_url,type,privacy&access_token=#{user.facebook.accesstoken}"
    content_serialized = open(url).read
    content_opened = JSON.parse(content_serialized)
    pagenext=content_opened['']
    page1=content_opened['data']
    page1.each do |content|
      if content["privacy"]["value"] == "EVERYONE"
         Content.create(
          user: user,
          external_provider: "facebook",
          external_id: content["id"],
          external_created_date: content["created_time"],
          external_edit_date: content["updated_time"],
          file_type: content["type"],
          selected: false,
          coef_total: 1,
          text_publication: content["message"],
          url_image: content["picture"]
          )
      end
    end
  end
end

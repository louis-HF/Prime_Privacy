require 'json'
require 'open-uri'

class FacebookService

  def initialize(user)
    @current_user = user
  end

  def facebook
    facebook_feed
    facebook_subscriptions
    facebook_photos
    # VisionService.new(@current_user).image_analysis
    WordTester.new(@current_user).find_keywords
    StatisticService.new(@current_user).compute_userstat
  end

  def facebook_feed
    url = "https://graph.facebook.com/v3.2/#{@current_user.facebook.uid}/feed?fields=object_id%2Cfull_picture%2Cpicture%2Cid%2Ccreated_time%2Ctype%2Cupdated_time%2Clink%2Cmessage%2Cprivacy&access_token=#{@current_user.facebook.accesstoken}"
    content_serialized = open(url).read
    content_opened = JSON.parse(content_serialized)
    while !url.nil?
      currentpage = content_opened['data']
      currentpage.each do |content|
        if content["privacy"]["value"] == "EVERYONE"
          if content["picture"].nil?
            facebook_posts(content)
          else
            facebook_images_feed(content)
          end
        end
      end
      break if content_opened['paging'].nil?
      break if content_opened['paging']['next'].nil?
      url = content_opened['paging']['next']
      content_serialized = open(url).read
      content_opened = JSON.parse(content_serialized)
    end
  end

  def facebook_subscriptions
    url = "https://graph.facebook.com/v3.2/#{@current_user.facebook.uid}/likes?fields=description%2Clink%2Cname%2Cbio%2Ccreated_time%2Cid%2Cabout&access_token=#{@current_user.facebook.accesstoken}"
    content_serialized = open(url).read
    content_opened = JSON.parse(content_serialized)
    while !url.nil?
      currentpage = content_opened['data']
      currentpage.each do |content|
        facebook_likes(content)
      end
      break if content_opened['paging']['next'].nil?
      url = content_opened['paging']['next']
      content_serialized = open(url).read
      content_opened = JSON.parse(content_serialized)
    end
  end

  def facebook_photos
    url = "https://graph.facebook.com/v3.2/#{@current_user.facebook.uid}/photos/tagged?fields=id%2Ccreated_time%2Clink%2Cname&access_token=#{@current_user.facebook.accesstoken}"
    content_serialized = open(url).read
    content_opened = JSON.parse(content_serialized)
    while !url.nil?
      currentpage = content_opened['data']
      currentpage.each do |content|
        facebook_images(content)
      end
      break if content_opened['paging'].nil?
      break if content_opened['paging']['next'].nil?
      url = content_opened['paging']['next']
      content_serialized = open(url).read
      content_opened = JSON.parse(content_serialized)
    end
  end

  def facebook_posts(content)
    if !content["message"].nil?
      Content.create(
            user: @current_user,
            external_provider: "facebook",
            external_id: content["id"],
            external_created_date: content["created_time"],
            external_edit_date: content["updated_time"],
            file_type: "post",
            selected: false,
            coef_total: 0,
            text_publication: content["message"],
            url_image: nil,
            scan_date: Date.today,
            publication_url: content["link"]
            )
    end
  end

  def facebook_images_feed(content)
    if !content["full_picture"].include?("hphotos") && !content["full_picture"].include?("external.xx")
      Content.create(
              user: @current_user,
              external_provider: "facebook",
              external_id: content["id"],
              external_created_date: content["created_time"],
              external_edit_date: content["updated_time"],
              file_type: "image",
              selected: false,
              coef_total: 0,
              text_publication: content["message"],
              url_image:content["full_picture"],
              scan_date: Date.today,
              publication_url: content["link"]
              )
    end
  end


  def facebook_images(content)
    image_url = "https://graph.facebook.com/v3.2/#{content["id"]}?fields=images,album&access_token=#{@current_user.facebook.accesstoken}"
    image_serialized = open(image_url).read
    image_opened = JSON.parse(image_serialized)
    image_opened["images"][3].nil? ? image = image_opened["images"][0]["source"] : image = image_opened["images"][3]["source"]
    if !image_opened["album"].nil?
      album_url = "https://graph.facebook.com/v3.2/#{image_opened["album"]["id"]}?fields=privacy&access_token=#{@current_user.facebook.accesstoken}"
      album_serialized = open(album_url).read
      album_opened = JSON.parse(album_serialized)
      album_opened["privacy"] == "everyone" ? test = true : test = false
    else
      test = true
    end
    if test
      Content.create(
            user: @current_user,
            external_provider: "facebook",
            external_id: content["id"],
            external_created_date: content["created_time"],
            external_edit_date: content["updated_time"],
            file_type: "image",
            selected: false,
            coef_total: 0,
            text_publication: content["name"],
            url_image: image,
            scan_date: Date.today,
            publication_url: content["link"]
            )
    end
  end

  def facebook_likes(content)
    content["bio"].nil? ? bio = "" : bio = content["bio"]
    content["description"].nil? ? description = "" : description = content["description"]
    content["about"].nil? ? about = "" : about = content["about"]
    Content.create(
            user: @current_user,
            external_provider: "facebook",
            external_id: content["id"],
            external_created_date: content["created_time"],
            external_edit_date: nil,
            file_type: "like",
            selected: false,
            coef_total: 0,
            text_publication: content["name"],
            url_image: nil,
            description: "#{bio} #{description} #{content}",
            scan_date: Date.today,
            publication_url: content["link"]
            )
  end

end

require 'json'
require 'open-uri'
require 'rest-client'
require "google/cloud/vision"



# vision = Google::Cloud::Vision.new project: project_id

# image = vision.image "https://images.unsplash.com/photo-1532635241-17e820acc59f?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3eb43b897f17dfd077c53caaef4c14ed&auto=format&fit=crop&w=1003&q=80"
# annotation = vision.annotate image, labels: true
# puts annotation.labels.count
# puts annotation.labels

#def detect_labels
  # [START vision_label_detection]
  # project_id = "Your Google Cloud project ID"
  # image_path = "Path to local image file, eg. './image.png'"
#project_id = "primeprivacy-221608"
#image_path = "https://images.unsplash.com/photo-1532635241-17e820acc59f?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3eb43b897f17dfd077c53caaef4c14ed&auto=format&fit=crop&w=1003&q=80"

  #require "google/cloud/vision"

  # vision = Google::Cloud::Vision.new project: project_id
  # image  = vision.image image_path

  # image.labels.each do |label|
   # puts label.description
  #end
#end

#detect_labels

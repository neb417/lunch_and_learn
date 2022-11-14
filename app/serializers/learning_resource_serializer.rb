class LearningResourceSerializer
  def self.serialize_media(country, video, images)
    {
      "data": {
        "id": nil,
        "type": 'learning_resource',
        "attributes": {
          "country": country,
          "video": {
            "title": video.title,
            "youtube_video_id": video.id
          },
          "images": images.map do |image|
          {
            'alt_tag': image.image_title,
            'url': image.image_url
          }
          end
        }
      }
    }
  end
end

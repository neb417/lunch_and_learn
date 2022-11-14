class LearningResourceSerializer
  def self.serialze_media(country, video_title, video_id, images)
    {
      "data": {
        "id": nil,
        "type": 'learning_resource',
        "attributes": {
          "country": country,
          "video": {
            "title": video_title,
            "youtube_video_id": video_id
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

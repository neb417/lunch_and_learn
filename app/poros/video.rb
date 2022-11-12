class Video
  # attr_reader
  def initialize(video, info)
    @youtube_video_id = video[:id]
  end
end
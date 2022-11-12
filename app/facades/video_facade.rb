class VideoFacade
  def self.return_video(country)
    video = VideoService.call_for_video(country)
    id = video[:items][:id][:videoId]
    info = VideoService.call_for_video_details(id)
    Video.new(video, info)
  end
end
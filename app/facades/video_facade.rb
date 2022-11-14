class VideoFacade
  def self.return_video(country)
    video = VideoService.call_for_video(country)
    id = video[:items].first[:id][:videoId]
    info = VideoService.call_for_video_details(id)
    VideoPoro.new(info, id)
  end
end

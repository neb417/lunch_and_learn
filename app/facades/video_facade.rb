class VideoFacade
  def self.return_video(country)
    VideoService.call_for_video(country)
  end
end
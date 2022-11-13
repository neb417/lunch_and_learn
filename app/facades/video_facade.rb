class VideoFacade
  def self.return_video(country)
    video = VideoService.call_for_video(country)
    id = video[:items].first[:id][:videoId]
    info = VideoService.call_for_video_details(id)
    _title, _video_id = [info[:items].first[:snippet][:title], id]
  end
end

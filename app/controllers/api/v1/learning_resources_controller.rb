class Api::V1::LearningResourcesController < ApplicationController
  def index
    country = params[:country]
    video_title, video_id = VideoFacade.return_video(country)
    images = ImageFacade.return_images(country)
    render json: LearningResourceSerializer.serialze_media(country, video_title, video_id, images)
  end
end

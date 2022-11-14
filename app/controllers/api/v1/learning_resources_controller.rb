class Api::V1::LearningResourcesController < ApplicationController
  before_action :country
  def index
    video_title, video_id = VideoFacade.return_video(@country)
    images = ImageFacade.return_images(@country)
    render json: LearningResourceSerializer.serialze_media(@country, video_title, video_id, images)
  end

  private

  def country
    @country ||= params[:country]
  end
end

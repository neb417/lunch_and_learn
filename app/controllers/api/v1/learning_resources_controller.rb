class Api::V1::LearningResourcesController < ApplicationController
  before_action :country
  def index
    video = VideoFacade.return_video(@country)
    images = ImageFacade.return_images(@country)
    render json: LearningResourceSerializer.serialize_media(@country, video, images)
  end

  private

  def country
    @country ||= params[:country]
  end
end

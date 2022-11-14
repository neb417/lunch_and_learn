class Api::V1::LearningResourcesController < ApplicationController
  before_action :generate_country
  def index
    return error_message(@country) if @country.instance_of?(Hash)

    video = VideoFacade.return_video(@country)
    images = ImageFacade.return_images(@country)
    render json: LearningResourceSerializer.serialize_media(@country, video, images)
  end

  def error_message(message)
    render json: ErrorSerializer.error_serializer(message, params[:country]), status: 400
  end
end

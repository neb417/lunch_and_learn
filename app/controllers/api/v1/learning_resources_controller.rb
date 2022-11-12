class Api::V1::LearningResourcesController < ApplicationController
  def index
    country = params[:country]
    VideoFacade.return_video(country)
    # PhotoFacade.return_photos(country)
  end
end

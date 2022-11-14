class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: FavoriteSerializer.error_serializer, status: 403
    else
      params[:user_id] = user.id
      favs = user.favorites
      render json: FavoriteSerializer.serialize_user_favorites(favs), status: 200
    end
  end

  def create
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render json: FavoriteSerializer.error_serializer, status: 403
    else
      params[:user_id] = user.id
      user.favorites.create!(favorite_params)
      render json: FavoriteSerializer.serialize_favorite, status: 201
    end
  end

  private

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title, :user_id)
  end
end

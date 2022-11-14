class Api::V1::FavoritesController < ApplicationController
  before_action :find_user
  def index
    favs = @user.favorites
    render json: FavoriteSerializer.serialize_user_favorites(favs), status: 200
  end

  def create
    @user.favorites.create!(favorite_params)
    render json: FavoriteSerializer.serialize_favorite, status: 201
  end

  private

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title, :user_id)
  end

  def api_error
    render json: FavoriteSerializer.error_serializer, status: 400
  end

  def find_user
    @user = User.find_by(api_key: params[:api_key])
    return api_error if @user.nil?

    params[:user_id] = @user.id
  end
end

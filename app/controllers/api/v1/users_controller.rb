class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      params[:api_key] = user.generate_api
      user.update(user_params)
      render json: UserSerializer.serialize_user(user)
    else
      render json: {error: 'nope'}
    end
  end

  private

  def user_params
    params.permit(:name, :email, :api_key)
  end
end
class Api::V1::UsersController < ApplicationController
  before_action :new_user
  # before_create :new_user

  def create
    return create_user if @user.save

    render json: ErrorSerializer.error_user_serializer(@user.errors.full_messages), status: 400
  end

  private

  def user_params
    params.permit(:name, :email, :api_key, :password, :password_confirmation)
  end

  def new_user
    # binding.pry
    @user = User.new(user_params)
  end

  def create_user
    params[:api_key] = @user.generate_api
    @user.update(user_params)
    render json: UserSerializer.serialize_user(@user), status: 201
  end
end

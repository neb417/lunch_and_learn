class Api::V1::SessionsController < ApplicationController
  before_action :find_user

  def create
    if @user&.authenticate(params[:password])
      render json: UserSerializer.serialize_user(@user), status: 200
    else
      render json: ErrorSerializer.error_credentials_serializer, status: 400
    end
  end

  private

  def find_user
    @user = User.find_by_email(params[:email])
  end
end

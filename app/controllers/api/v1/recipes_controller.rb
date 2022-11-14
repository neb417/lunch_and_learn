class Api::V1::RecipesController < ApplicationController
  before_action :generate_country
  def index
    return error_message(@country) if @country.instance_of?(Hash)

    recipes = RecipeFacade.return_recipes(@country)
    render json: RecipeSerializer.serialize_recipes(recipes, @country)
  end

  def error_message(message)
    render json: ErrorSerializer.error_serializer(message, params[:country]), status: 400
  end
end

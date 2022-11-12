class Api::V1::RecipesController < ApplicationController
  def index
    country = params[:country] || CountryFacade.select_country
    recipes = RecipeFacade.return_recipes(country)
    render json: RecipeSerializer.serialize_recipes(recipes, country)
  end
end

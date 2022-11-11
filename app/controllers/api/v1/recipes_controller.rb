class Api::V1::RecipesController < ApplicationController
  def index
    country = CountryFacade.select_country
    RecipeFacade.return_recipes(country)
    # render json:
  end
end
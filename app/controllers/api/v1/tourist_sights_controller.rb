class Api::V1::TouristSightsController < ApplicationController
  def index
    country = params[:country] || CountryFacade.select_country
    latlng = CountryFacade.return_capital_latlng(country)
    places = PlaceFacade.return_places(latlng)
    render json: PlaceSerializer.serialize_place(places)
  end
end
class Api::V1::TouristSightsController < ApplicationController
  def index
    country = params[:country] || CountryFacade.select_country
    latlng = CountryFacade.return_capital_latlng(country)
    return_sites(country, latlng)
  end

  def return_sites(country, latlng)
    if latlng.include?(:status)
      render json: PlaceSerializer.error_serializer(country, latlng), status: latlng[:status]
    else
      places = PlaceFacade.return_places(latlng)
      render json: PlaceSerializer.serialize_place(places)
    end
  end
end
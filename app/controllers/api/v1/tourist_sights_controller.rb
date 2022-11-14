class Api::V1::TouristSightsController < ApplicationController
  def index
    country = params[:country] || CountryFacade.select_country
    latlng = CountryFacade.return_capital_latlng(country)
    return_sites(country, latlng)
  end

  private

  def return_sites(country, latlng)
    return country_error(country, latlng) if latlng.include?(:status)

    places = PlaceFacade.return_places(latlng)
    render json: PlaceSerializer.serialize_place(places)
  end

  def country_error(country, latlng)
    render json: PlaceSerializer.error_serializer(country, latlng), status: 400
  end
end

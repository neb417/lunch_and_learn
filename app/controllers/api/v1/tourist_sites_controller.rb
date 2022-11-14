class Api::V1::TouristSitesController < ApplicationController
  def index
    latlng = CountryFacade.return_capital_latlng(params[:country])
    places = PlaceFacade.return_places(latlng)
    render json: PlaceSerializer.serialize_place(places)
  end
end
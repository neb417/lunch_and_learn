class Api::V1::PlacesController < ApplicationController
  def index
    # latlng = CountryFacade.get lat and lon country capital
    place = PlaceFacade.return_places(latlng)
    render json: PlaceSerializer.serialize_place(place)
  end
end
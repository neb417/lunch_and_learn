class PlaceFacade
  def self.return_place
    places = PlaceService.call_for_place
  end
end

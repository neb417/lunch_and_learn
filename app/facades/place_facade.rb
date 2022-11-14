class PlaceFacade
  def self.return_places(latlng)
    places = PlaceService.call_for_place(latlng)
    places[:features].map do |place|
      {
        name: place[:properties][:name],
        address: place[:properties][:formatted],
        place_id: place[:properties][:place_id]
      }
    end
  end
end

class PlaceFacade
  def self.return_places(latlng)
    places = PlaceService.call_for_place(latlng)
    site_mapping(places[:features])
  end

  def self.site_mapping(places)
    places.map do |place|
      {
        name: place[:properties][:name],
        address: place[:properties][:formatted],
        place_id: place[:properties][:place_id]
      }
    end
  end
end

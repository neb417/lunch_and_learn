class PlaceSerializer
  def self.serialize_place(places)
    {
      "data": places.map do |place|
        {
          "id": nil,
          "type": 'tourist_site',
          "attributes": {
            "name": place[:name],
            "address": place[:address],
            "place_id": place[:id]
          }
        }
      end
    }
  end
end
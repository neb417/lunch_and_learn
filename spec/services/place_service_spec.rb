require 'rails_helper'

RSpec.describe PlaceService do
  it 'returns tourist sights places', :vcr do
    latlng = [48.87, 2.33]
    places = PlaceService.call_for_place(latlng)

    expect(places).to be_a Hash
    expect(places).to have_key(:features)
    expect(places[:features]).to be_an Array

    place = places[:features].first

    expect(place).to be_a Hash
    expect(place).to have_key(:properties)
    expect(place).to be_a Hash
    expect(place[:properties]).to have_key(:name)
    expect(place[:properties]).to have_key(:formatted)
    expect(place[:properties]).to have_key(:datasource)
    expect(place[:properties][:datasource]).to have_key(:raw)
    expect(place[:properties][:datasource][:raw]).to have_key(:osm_id)
  end
end
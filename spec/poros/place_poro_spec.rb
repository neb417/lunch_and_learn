require 'rails_helper'

RSpec.describe PlacePoro do
  it 'has attributes' do
    hash = {
      type: 'Feature',
      properties:
        {
          name: 'Maison de Chateaubriand',
          housenumber: '87',
          street: 'Rue de Chateaubriand',
          quarter: 'Robinson',
          suburb: 'La Butte Rouge',
          city: 'Châtenay-Malabry',
          municipality: 'Antony',
          county: 'Hauts-de-Seine',
          state: 'Ile-de-France',
          region: 'Metropolitan France',
          postcode: '92290',
          country: 'France',
          country_code: 'fr',
          lon: 2.2642505154094605,
          lat: 48.77268875,
          formatted: 'Maison de Chateaubriand, 87 Rue de Chateaubriand, 92290 Châtenay-Malabry, France',
          address_line1: 'Maison de Chateaubriand',
          address_line2: '87 Rue de Chateaubriand, 92290 Châtenay-Malabry, France',
          place_id:
          '515d1f5d62721d024059cf1b831ae7624840f00102f901de515805000000009203174d6169736f6e2064652043686174656175627269616e64'
        }
    }

    place = PlacePoro.new(hash)
    expect(place.name).to eq(hash[:properties][:name])
    expect(place.address).to eq(hash[:properties][:formatted])
    expect(place.place_id).to eq(hash[:properties][:place_id])
  end
end

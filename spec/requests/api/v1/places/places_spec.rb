require 'rails_helper'

RSpec.describe 'Places Tourist Sites Request' do
  describe 'uses passed country info to return a tourist sites' do
    before :each do
      post api_v1_tourist_sites_path(france)
    end

    it 'returns successful response' do
      # Response:
      # Your API will return:
      # - A collection of all found tourist sights within a 20000 meter radius of the capital city.
      # - Each sight should list its:
      #   - name
      #   - formatted address
      #   - place_id (also from the Place API)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to be_a String
    end
  end

  it 'returns correct attributes' do
    places = JSON.parse(response.body, symbolize_names: true)
    place = places.first
    expect(place).to have_key(:data)
    expect(place[:data]).to have_key(:type)
    expect(place[:data][:type]).to eq('tourist_site')
    expect(place[:data]).to have_key(:id)
    expect(place[:data][:id]).to eq(nil)
    expect(place[:data]).to have_key(:attributes)
    expect(place[:data][:attributes]).to be_a Hash
    expect(place[:data][:attributes]).to have_key(:name)
    expect(place[:data][:attributes]).to have_key(:address)
    expect(place[:data][:attributes]).to have_key(:place_id)
    expect(place[:data][:attributes][:name]).to be_a String
    expect(place[:data][:attributes][:address]).to be_a String
    expect(place[:data][:attributes][:place_id]).to be_a String
  end
end

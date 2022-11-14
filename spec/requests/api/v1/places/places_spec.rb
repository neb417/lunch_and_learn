require 'rails_helper'

RSpec.describe 'Places Tourist Sites Request' do
  describe 'uses passed country info to return a tourist sites', :vcr do
    before :each do
      country = { country: 'france' }
      get api_v1_tourist_sites_path(country)
    end

    it 'returns successful response' do
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to be_a String
    end

    it 'returns correct attributes' do
      places = JSON.parse(response.body, symbolize_names: true)
      expect(places).to have_key(:data)
      place = places[:data].first
      expect(place).to have_key(:type)
      expect(place[:type]).to eq('tourist_site')
      expect(place).to have_key(:id)
      expect(place[:id]).to eq(nil)
      expect(place).to have_key(:attributes)
      expect(place[:attributes]).to be_a Hash
      expect(place[:attributes]).to have_key(:name)
      expect(place[:attributes]).to have_key(:address)
      expect(place[:attributes]).to have_key(:place_id)
      expect(place[:attributes][:name]).to be_a String
      expect(place[:attributes][:address]).to be_a String
      expect(place[:attributes][:place_id]).to be_a String
    end
  end
end

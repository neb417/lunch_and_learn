require 'rails_helper'

RSpec.describe 'Learning Resources end point' do
  describe 'uses passed country to return leraning resources', :vcr do
    before :each do
      country = { country: 'Malawi' }
      get api_v1_learning_resources_path(country)
    end

    it 'uses passed country to find media' do
      media = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to be_a String
      expect(media).to be_a Hash
      expect(media).to have_key(:data)
      expect(media[:data]).to be_a Hash
      expect(media[:data]).to have_key(:type)
      expect(media[:data]).to have_key(:attributes)
      expect(media[:data][:type]).to eq('learning_resource')
    end

    it 'returns attributes' do
      country = { country: 'Malawi' }
      media = JSON.parse(response.body, symbolize_names: true)
      attributes = media[:data][:attributes]
      expect(attributes).to have_key(:country)
      expect(attributes).to have_key(:video)
      expect(attributes[:video]).to have_key(:title)
      expect(attributes[:video]).to have_key(:youtube_video_id)
      expect(attributes).to have_key(:images)
      expect(attributes[:country]).to eq(country[:country])
      expect(attributes[:video]).to be_a Hash
      expect(attributes[:images]).to be_an Array
      expect(attributes[:images].first).to be_a Hash
      expect(attributes[:images].first).to have_key(:alt_tag)
      expect(attributes[:images].first).to have_key(:url)
    end

    it 'returns only information necessary to pass to FE' do
      media = JSON.parse(response.body, symbolize_names: true)
      expect(media[:data].count).to eq(3)
      expect(media[:data][:attributes].count).to eq(3)
      expect(media[:data][:attributes][:video].count).to eq(2)
      expect(media[:data][:attributes][:images].count).to eq(10)
      expect(media[:data][:attributes][:images].first.count).to eq(2)
    end
  end
  describe 'extension work' do
    it 'returns 4xx when passed country is invalid', :vcr do
      country = { country: 'france' }
      get api_v1_learning_resources_path(country)
      expect(response.status).to eq(200)

      country2 = { country: 'etwouic' }
      get api_v1_learning_resources_path(country2)
      expect(response.status).to eq(400)
      error = JSON.parse(response.body, symbolize_names: true)
      expect(error[:data][:message]).to eq("Country input 'etwouic' not found")
    end
  end
end

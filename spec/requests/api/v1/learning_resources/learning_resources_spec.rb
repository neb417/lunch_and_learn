require 'rails_helper'

RSpec.describe 'Learning Resources end point' do
  describe 'uses passed country to return leraning resources' do
    before :each do
      country = { country: 'Sweden' }
      get api_v1_learning_resources_path(country)
      media = JSON.parse(response.body, symbolize_names: true)
    end

    it 'uses passed country to find media' do
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to be_a String
      expect(media).to be_a Hash
      expect(media).to have_key(:data)
      expect(media[:data]).to be_a Hash
      expect(media[:data]).to have_key(:type)
      expect(media[:data]).to have_key(:attributes)
      expect(media[:data][:type]).to eq('learning_resources')
    end

    it 'returns attributes' do
      attributes = media[:data][:attributes]
      expect(attributes).to have_key(:country)
      expect(attributes).to have_key(:video)
      expect(attributes[:video]).to have_key(:title)
      expect(attributes[:video]).to have_key(:youtube_video_id)
      expect(attributes).to have_key(:images)
      expect(attributes[:country]).to eq(country)
      expect(attributes[:video]).to be_a Hash
      expect(attributes[:images]).to be_an Array
      expect(attributes[:images].first).to be_a Hash
      expect(attributes[:images].first).to have_key(:alt_tag)
      expect(attributes[:images].first).to have_key(:url)
    end

    it 'returns only information necessary to pass to FE' do
      expect(media[:data].count).to eq(3)
      expect(media[:attributes].count).to eq(3)
      expect(media[:attributes][:video].count).to eq(1)
      expect(media[:attributes][:images].count).to eq(10)
      expect(media[:attributes][:images].first.count).to eq(2)
    end
  end
end

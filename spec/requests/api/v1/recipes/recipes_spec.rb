require 'rails_helper'

RSpec.describe 'recipe end point' do
  describe 'recipe call with no country param', :vcr do

    it 'uses fetched country to return recipes' do
      get api_v1_recipes_path
      recipes = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to be_a String
      expect(recipes).to be_a Hash
      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to be_an Array

      recipes[:data].each do |recipe|
        expect(recipe).to have_key(:id)
        expect(recipe[:id]).to eq(nil)
        expect(recipe).to have_key(:type)
        expect(recipe[:type]).to eq('recipe')
        expect(recipe).to have_key(:attributes)
        expect(recipe[:attributes]).to have_key(:title)
        expect(recipe[:attributes]).to have_key(:url)
        expect(recipe[:attributes]).to have_key(:country)
        expect(recipe[:attributes]).to have_key(:image)
        expect(recipe[:attributes].count).to eq(4)
      end
    end

    it 'does not include other attributes recieved from API endpoint' do
      get api_v1_recipes_path
      recipes = JSON.parse(response.body, symbolize_names: true)
      recipes[:data].each do |recipe|
        expect(recipe.count).to eq(3)
        expect(recipe[:attributes].count).to eq(4)
      end
    end
  end

  describe 'calls with country param passed', :vcr do
    it 'returns recipes with country' do
      country = { country: 'Malawi' }
      get api_v1_recipes_path(country)
      recipes = JSON.parse(response.body, symbolize_names: true)

      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to be_an Array
    end

    it 'returns empty array when no recipes are returned' do
      country = { country: 'etwouic' }
      get api_v1_recipes_path(country)
      recipes = JSON.parse(response.body, symbolize_names: true)

      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to be_an Array
      expect(recipes[:data].empty?).to be true
    end
  end
end

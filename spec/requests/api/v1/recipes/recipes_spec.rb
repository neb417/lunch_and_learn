require 'rails_helper'

RSpec.describe 'recipe end point' do
  describe 'recipe call with no country param' do
    it 'fetches a country name' do
      get api_v1_recipes_path

      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'uses fetched country to return recipes' do
      get api_v1_recipes_path

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to be_a String
    end
  end
end

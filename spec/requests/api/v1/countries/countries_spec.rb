require 'rails_helper'

RSpec.describe 'country end point' do
  describe 'country call with no country param' do
    it 'fetches a country name' do
      get api_v1_countries_path

      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'uses fetched country to return recipes' do

    end
  end
end
require 'rails_helper'

RSpec.describe 'recipe end point' do
  describe 'recipe call with no country param' do
    it 'fetches a country name' do
      get api_v1_country_path

      # expect()
    end

    it 'uses fetched country to return recipes' do

    end
  end
end

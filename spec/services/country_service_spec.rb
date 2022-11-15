require 'rails_helper'

RSpec.describe CountryService do
  describe 'call_for_countries' do
    it 'returns correct attrubutes', :vcr do
      countries = CountryService.call_for_countries

      expect(countries).to be_an Array
      country = countries.first
      expect(country).to have_key(:name)
      expect(country[:name]).to be_a Hash
      expect(country[:name]).to have_key(:common)
      expect(country[:name][:common]).to be_a String
    end

    it 'cache is caching' do
      cache = Rails.cache.read('countries_api_cache')
      expect(cache).to be_an Array
      expect(cache.empty?).to be false
      expect(cache.first).to have_key(:name)
      expect(cache.first[:name]).to have_key(:common)
      expect(cache.first[:name][:common]).to be_a String
      expect(cache.first[:name][:common].empty?).to be false
    end
  end
end
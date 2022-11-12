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
  end
end
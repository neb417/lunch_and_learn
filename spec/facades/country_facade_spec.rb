require 'rails_helper'

RSpec.describe CountryFacade do
  it 'returns a country', :vcr do
    country = CountryFacade.select_country
    expect(country).to be_a String
  end
end
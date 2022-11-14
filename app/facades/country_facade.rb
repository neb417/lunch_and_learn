class CountryFacade

  def self.select_country
    countries = CountryService.call_for_countries
    country = countries.sample
    country[:name][:common]
  end
end

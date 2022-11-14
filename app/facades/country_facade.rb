class CountryFacade

  def self.select_country
    countries = CountryService.call_for_countries
    country = countries.sample
    country[:name][:common]
  end

  def self.return_capital_latlng(country)
    info = CountryService.call_for_capital(country)
    # binding.pry
    if info.include?(:status)
      info
    else
      country_info = info.first
      country_info[:capitalInfo][:latlng]
    end
  end
end

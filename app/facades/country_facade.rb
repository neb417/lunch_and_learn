class CountryFacade
  def self.select_country
    countries = CountryService.call_for_countries
    country = countries.sample
    country[:name][:common]
  end

  def self.return_capital_latlng(country)
    info = CountryService.call_for_capital(country)
    country_return(info)
  end

  def self.country_return(info)
    return info if info.include?(:status)

    country_info = info.first
    country_info[:capitalInfo][:latlng]
  end
end

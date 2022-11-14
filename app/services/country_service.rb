class CountryService
  def self.call_for_countries
    response = conn.get('/v3.1/all')
    parse(response)
  end

  def self.call_for_country_info(country)
    response = conn.get("/v3.1/name/#{country}")
    parse(response)
  end

  def self.conn
    Faraday.new('https://restcountries.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private_class_method :conn, :parse
end

class PlaceService
  def self.call_for_place(latlng)
    response = conn.get('/v2/places') do |req|
      req.params[:filter] = "circle:#{latlng.last},#{latlng.first},20000"
      req.params[:categories] = 'tourism.sights'
    end
    parse(response)
  end

  def self.conn
    Faraday.new('https://api.geoapify.com') do |faraday|
      faraday.params['apiKey'] = ENV['geo_api_key']
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private_class_method :conn, :parse
end

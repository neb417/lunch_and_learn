class ImageService
  def self.call_for_images(country)
    response = conn.get('/search/photos') do |req|
      req.params[:query] = country
    end
    parse(response)
  end

  def self.conn
    Faraday.new('https://api.unsplash.com') do |faraday|
      faraday.params['client_id'] = ENV['unsplash_access_key']
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private_class_method :conn, :parse
end

class RecipeService
  def self.call_for_recipes(country)
    response = conn.get('/api/recipes/v2?type=public') do |req|
      req.params['q'] = country
    end
    parse(response)
  end

  def self.conn
    Faraday.new('https://api.edamam.com') do |faraday|
      faraday.params['app_id'] = ENV['recipe_app_id']
      faraday.params['app_key'] = ENV['recipe_api_key']
      faraday.params['random'] = 'true'
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private_class_method :conn, :parse
end

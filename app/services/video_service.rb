class VideoService
  def self.call_for_video(country)
    response = conn.get('/youtube/v3/search') do |req|
      req.params['maxResults'] = 1
      req.params['q'] = country
      req.params['channelId'] = 'UCluQ5yInbeAkkeCndNnUhpw'
    end
    parse(response)
  end

  def self.call_for_video_details(video_id)
    response = conn.get('/youtube/v3/videos') do |req|
      req.params[:id] = video_id
      req.params[:part] = 'snippet'
      req.params[:fields] = 'items(snippet(title))'
    end
    parse(response)
  end

  def self.conn
    Faraday.new('https://www.googleapis.com') do |faraday|
      faraday.params['key'] = ENV['google_api_key']
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private_class_method :conn, :parse
end

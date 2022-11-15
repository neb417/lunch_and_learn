class CountryCallJob
  include Sidekiq::Job

  def perform
    Rails.cache.fetch('countries_api_cache', expires_in: 7.days) do
      response = conn.get('/v3.1/all')
      parse(response)
    end
  end
end

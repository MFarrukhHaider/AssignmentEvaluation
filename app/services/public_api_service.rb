require 'httparty'

class PublicApiService
  include HTTParty
  base_uri 'https://api.punkapi.com/v2' # Replace with the actual API endpoint

  def fetch_data
    response = self.class.get('/beers')
    if response.success?
      JSON.parse(response.body)
    else
      raise "Error fetching data from the API: #{response.code}"
    end
  end
end


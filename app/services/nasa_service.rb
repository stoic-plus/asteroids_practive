class NasaService
  def initialize(api_key)
    @api_key = api_key
  end

  def self.neo_feed(start_date, end_date)
    response = conn.get do
      req.url "neo/rest/v1/feed?"
      req.params["api_key"] = @api_key
      req.params['start_date'] = start_date
      req.params['end_date'] = end_date
    end
    JSON.parse(response.body, symbolize_keys: true)
  end

  private
  #
  # def get_json(path)
  #
  # end

  def conn
    Farday.new(url: "https://api.nasa.gov") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end

class NasaService
  def initialize(api_key)
    @api_key = api_key
  end

  def neo_feed(start_date, end_date)
    get_json("neo/rest/v1/feed?", start_date, end_date)[:near_earth_objects]
  end

  def neo_lookup(neo_reference_id)
    get_json("neo/rest/v1/neo/#{neo_reference_id}")
  end

  private

  def get_json(path, start_date=nil, end_date=nil)
    response = conn.get do |req|
      req.url path
      req.params["api_key"] = @api_key
      req.params['start_date'] = start_date if start_date
      req.params['end_date'] = end_date if end_date
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.nasa.gov") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end

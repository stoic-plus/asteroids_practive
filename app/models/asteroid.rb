class Asteroid
  attr_reader :date,:links,:name,:neo_reference_id,:hazardous

  def initialize(date, attributes)
    @date = date
    @links = attributes[:links]
    @name = attributes[:name]
    @neo_reference_id = attributes[:neo_reference_id]
    @hazardous = attributes[:is_potentially_hazardous_asteroid]
  end
end

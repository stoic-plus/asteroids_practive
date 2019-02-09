class NasaFacade
  def initialize(nasa_key)
    @nasa_key = nasa_key
  end

  def most_dangerous_day(start_date, end_date)
    asteroids = asteroids_for_range(start_date, end_date)
    binding.pry
  end

  private

  def service
    NasaService.new(@nasa_key)
  end

  def asteroids_for_range(start_date, end_date)
    asteroids = service.neo_feed(start_date, end_date)
    asteroids.map do |date, near_earth_objects|
      Asteroid.new(date, near_earth_objects)
    end
  end
end

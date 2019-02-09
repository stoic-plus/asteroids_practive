class NasaFacade
  def initialize(nasa_key)
    @nasa_key = nasa_key
  end

  def most_dangerous_day(start_date, end_date)
   dangerous = get_dangerous(asteroids_for_range(start_date, end_date))
   dangerous.group_by{|asteroid| asteroid.date }.max_by{|date, asteroids| asteroids.count }
  end

  private

  def service
    NasaService.new(@nasa_key)
  end

  def asteroids_for_range(start_date, end_date)
    dates_and_asteroids = service.neo_feed(start_date, end_date)
    asteroids = []
    dates_and_asteroids.each do |date, space_objects|
      space_objects.each do |raw_asteroid|
        asteroids.push(Asteroid.new(date, raw_asteroid))
      end
    end
    asteroids
  end

  def get_dangerous(asteroids)
    asteroids.select{ |asteroid| asteroid.hazardous }
  end
end

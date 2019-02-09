require 'rails_helper'

describe NasaService, type: :service do
  describe 'class methods' do
    context '.neo_feed' do
      it 'returns list of asteroids given date range' do
        service = NasaService.new(ENV["NASA_KEY"])
        asteroids = service.neo_feed("2018-01-01", "2018-01-07")
        
        expect(asteroids).to have_key(:"2018-01-04")
        asteroids = asteroids[:"2018-01-04"]
        expect(asteroids).to be_a(Array)
        asteroid = asteroids.first

        expect(asteroid).to have_key(:links)
        expect(asteroid).to have_key(:name)
        expect(asteroid).to have_key(:nasa_jpl_url)
        expect(asteroid).to have_key(:neo_reference_id)
      end
    end
  end
end

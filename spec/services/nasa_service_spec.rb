require 'rails_helper'

describe NasaService, type: :service do
  describe 'class methods' do
    context '.neo_feed' do
      it 'returns list of asteroids given date range' do
        service = NasaService.new(ENV["NASA_KEY"])
        asteroids = service.neo_feed("2018-01-01", "2018-01-07")
        binding.pry
      end
    end
  end
end

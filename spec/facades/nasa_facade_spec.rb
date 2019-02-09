require 'rails_helper'

describe NasaFacade, type: :facade do
  it 'exists' do
    nasa_facade = NasaFacade.new(ENV["NASA_KEY"])
    expect(nasa_facade).to be_a(NasaFacade)
  end

  describe 'instance methods' do
    context '#most_dangerous_day' do
      it 'returns day with the most asteroids with \'is_potentially_dangerous_asteroid\': true' do
        nasa_facade = NasaFacade.new(ENV["NASA_KEY"])
        expect(nasa_facade.most_dangerous_day("2018-01-01", "2018-01-07")).to eq("January 1, 2018")
      end
    end
  end
end

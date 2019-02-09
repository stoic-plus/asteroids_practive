require 'rails_helper'

describe NasaService, type: :service do
  describe 'class methods' do
    context '.most_dangerous_day' do
      it 'returns day with the most potentially_dangerous_asteroid given date range' do
        service = NasaService.new

        expect(service.most_dangerous_day("2018-01-01", "2018-01-07")).to eq("2018-01-01")
      end
    end
  end
end

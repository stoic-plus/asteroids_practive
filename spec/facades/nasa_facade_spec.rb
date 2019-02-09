require 'rails_helper'

describe NasaFacade, type: :facade do
  it 'exists' do
    nasa_facade = NasaFacade.new("2018-01-01", "2018-01-07")
    expect(nasa_facade).to be_a(NasaFacade)
  end
end

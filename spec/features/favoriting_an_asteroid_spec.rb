require 'rails_helper'

feature "Favoriting an asteroid" do
  include RSpec::Rails::ControllerExampleGroup
  let(:service) { NasaService.new(ENV["NASA_KEY"]) }
  # let(:facade) { NasaFacade.new(ENV["NASA_KEY"]) }

  context 'sending a POST req to user_favorites with API key and neo_reference_id' do
    before :each do
      @user = create(:user)
      @controller = Api::V1::User::FavoritesController.new
      @api_key = create(:api_key, value: ENV["NASA_KEY"], user: @user)
      @params = {
        api_key: ENV["NASA_KEY"],
        neo_reference_id: "2021277"
      }
      post :create, params: @params
    end
    it 'returns a response with status 200' do
      expect(response.code).to eq("200")
    end

    it 'returns favorited asteroid JSON response' do
      asteroid_json = service.neo_lookup("2021277")
      json_response = JSON.parse(response.body, symbolize_names: true)[:data]

      asteroid_info = {
        name: asteroid_json[:name],
        is_potentially_hazardous_asteroid: asteroid_json[:is_potentially_hazardous_asteroid]
      }

      expect(json_response[:id]).to eq("1")
      expect(json_response[:attributes][:neo_reference_id]).to eq("2021277")
      expect(json_response[:attributes][:user_id]).to eq(@user.id)
      expect(json_response[:attributes][:asteroid]).to eq(asteroid_info)
    end

    it 'creates a favorite asteroid for the user' do
      expect(Favorite.count).to eq(1)
      expect(Favorite.all.first.user_id).to eq(@user.id)
      expect(Favorite.all.first.neo_reference_id).to eq(@params[:neo_reference_id])
    end
  end
end

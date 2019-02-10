class Api::V1::User::FavoritesController < ApiBaseController
  def create
    asteroid = NasaFacade.new(api_key.value)
                .neo_lookup(current_user.id, params["neo_reference_id"])
    Favorite.create(neo_reference_id: params["neo_reference_id"], user: api_key.user)
    render json: AsteroidSerializer.new(asteroid)
  end
end

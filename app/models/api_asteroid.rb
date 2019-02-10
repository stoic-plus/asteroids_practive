class ApiAsteroid
  attr_reader :id, :neo_reference_id, :user_id, :asteroid
  @@count = 0

  def initialize(user_id, asteroid_attr)
    @id = @@count
    @@count += 1
    @neo_reference_id = asteroid_attr[:neo_reference_id]
    @user_id = user_id
    @asteroid = {
      name: asteroid_attr[:name],
      is_potentially_hazardous_asteroid: asteroid_attr[:is_potentially_hazardous_asteroid]
    }
  end
end

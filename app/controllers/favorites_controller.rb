class FavoritesController < PrivateController
  before_action :set_car, only: %i[create destroy]

  def create
    @favorite = Favorite.new(
      car: @car,
      user: current_user
    )
    @favorite.car = @car
    authorize @favorite

    @favorite.save
    redirect_to request.referrer
  end

  def destroy
    @favorite = @car.favorites.find_by(user: current_user)
    authorize @favorite

    @favorite.destroy
    redirect_to request.referrer
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end
end
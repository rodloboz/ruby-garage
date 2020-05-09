class GaragesController < PrivateController
  def show
    skip_authorization
    @cars = current_user.cars
  end
end

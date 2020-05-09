class TransfersController < PrivateController
  before_action :set_car

  def new
    @transfer = Transfer.new(car: @car)
    authorize @transfer

    @users = User.order(first_name: :asc) - [current_user]
  end

  def create
    new_owner_id = params.dig(:transfer, :new_owner)
    new_owner = User.find(new_owner_id) if new_owner_id
    @transfer = Transfer.new(car: @car, new_owner: new_owner)
    authorize @transfer

    if @transfer.save
      redirect_to garage_path
    else
      render :new
    end
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end
end

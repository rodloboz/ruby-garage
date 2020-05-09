class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update]

  def index
    @cars = policy_scope(Car.all)

    params[:page] = nil if @cars.page(params[:page])
                                .per(12).out_of_range?

    @cars = @cars.page(params[:page]).per(12)
  end

  def show
    @booking = Booking.new
  end

  def new
    @car = Car.new
    authorize @car

    @years = (Time.zone.now.year - 100)..Time.zone.now.year
  end

  def create
    @car = Car.new(car_params)
    @car.owner = current_user
    authorize @car

    if @car.save
      redirect_to @car
    else
      render :new
    end
  end

  def edit
    @years = (Time.zone.now.year - 100)..Time.zone.now.year
  end

  def update
    if @car.update(car_params)
      redirect_to @car
    else
      render :edit
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
    authorize @car
  end

  def car_params
    params.require(:car).permit(
      :manufacturer_id, :model_id, :color,
      :year, :number_plate, :description,
      :photo
    )
  end
end

class CarsController < ApplicationController
  before_action :set_car, only: :show

  def index
    @cars = Car.all
  end

  def show; end

  def new
    @car = Car.new
    @years = (Time.zone.now.year - 100)..Time.zone.now.year
  end

  def create
    @car = Car.new(car_params)
    @car.owner = current_user

    if @car.save
      redirect_to @car
    else
      render :new
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(
      :manufacturer_id, :model_id, :color, 
      :year, :number_plate, :description
    )
  end
end

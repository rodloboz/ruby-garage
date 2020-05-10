class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update]

  def index
    @cars = policy_scope(car_search)

    params[:page] = nil if @cars.page(params[:page])
                                .per(12).out_of_range?

    @cars = @cars.page(params[:page]).per(12)
    @manufacturers = Manufacturer.limit(5)
    @models = Model.limit(5)
    @min_price, @max_price = @cars.map(&:price_per_day).minmax
    @year_options = [
      ['Before 1950', '1900_1949'],
      ['1950-1959', '1950_1959'],
      ['1960-1969', '1960_1969'],
      ['1970-1979', '1970_1979'],
      ['1980-1989', '1980_1989'],
      ['1990-1999', '1990_1999'],
      ['2000-2009', '2000_2009'],
      ['2010-2020', '2010_2020']
    ]
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
      :photo, :price_per_day
    )
  end

  def years
    return nil if params[:year].blank?

    # clean 0 values
    without_zeros = params[:year]&.without('0')
    # convert to array of ranges
    without_zeros.map { |string| Range.new(*string.split('_').map(&:to_i)) }
  end

  def car_search
    CarSearchService.call(
      manufacturer: params[:manufacturer],
      model: params[:model],
      years: years,
      min_price: params[:min_price],
      max_price: params[:max_price]
    )
  end
end

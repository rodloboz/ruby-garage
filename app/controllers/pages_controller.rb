class PagesController < ApplicationController
  layout 'home'

  def home
    skip_authorization

    @featured_cars = Car.first(5)
    @latest_cars = Car.last(3)
    @manufacturers = Manufacturer.order(car_count: :desc).limit(5)
    @models = Model.order(car_count: :desc).limit(5)
    @min_price, @max_price = Car.pluck(:price_per_day).minmax
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
end

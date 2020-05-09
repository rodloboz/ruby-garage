class PagesController < ApplicationController
  def home
    @car = Car.first
    @car2 = Car.second
    @car3 = Car.third
    @car4 = Car.fourth
  end
end

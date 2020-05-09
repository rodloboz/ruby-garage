class PagesController < ApplicationController
  def home
    @featured_cars = Car.first(5)
    @latest_cars = Car.last(3)
  end
end

class PagesController < ApplicationController
  layout 'home'

  def home
    skip_authorization

    @featured_cars = Car.first(5)
    @latest_cars = Car.last(3)
  end
end

# frozen_string_literal: true

class CarSearchService
  def self.call(*args)
    new(*args).call
  end

  def initialize(
    cars: nil,
    manufacturer: nil,
    model: nil,
    years: nil,
    min_price: nil,
    max_price: nil
  )
    @cars = cars || Car.all
    @manufacturer = manufacturer
    @model = model
    @min_price = min_price
    @max_price = max_price
    @years = years
  end

  def call
    @cars = @cars.search_by_manufacturer(@manufacturer) if @manufacturer.present?
    @cars = @cars.search_by_model(@model) if @model.present?
    @cars = @cars.search_by_year_ranges(@years) if @years.present?
    @cars = @cars.where(price_per_day: @min_price..@max_price)
    @cars.with_attached_photo
  end
end

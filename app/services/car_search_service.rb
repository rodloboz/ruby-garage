# frozen_string_literal: true

class CarSearchService
  def self.call(*args)
    new(*args).call
  end

  def initialize(cars: nil, manufacturer: nil, model: nil)
    @cars = cars || Car.all
    @manufacturer = manufacturer
    @model = model
  end

  def call
    @cars = @cars.search_by_manufacturer(@manufacturer) if @manufacturer.present?
    @cars = @cars.search_by_model(@model) if @model.present?
    @cars.with_attached_photo
  end
end

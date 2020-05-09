# frozen_string_literal: true

class CarSearchService
  def self.call(*args)
    new(*args).call
  end

  def initialize(cars: nil, manufacturers: nil, models: nil)
    @cars = cars || Car.all
    @manufacturers = manufacturers
    @models = models
  end

  def call
    @cars = @cars.select_by_manufacturer(@manufacturers) if @manufacturers.present?
    @cars = @cars.select_by_model(@models) if @models.present?
    @cars.with_attached_photo
  end
end

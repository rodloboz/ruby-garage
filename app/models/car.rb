class Car < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :model
  belongs_to :owner, class_name: 'User'

  has_one_attached :photo

  validates :color,
            :description,
            :number_plate, presence: true

  validates :year, presence: true,
                  numericality: {
                    only_integer: true,
                    greater_than_or_equal_to: 1900,
                    lower_than_or_equal_to: Time.zone.now.year
                  }

  validate :check_manufacturer_model

  def name
    [manufacturer.name, model.name].join(' ')
  end

  private

  def check_manufacturer_model
    return true if manufacturer.nil? || manufacturer.models.exists?(model.id)

    errors.add(:model, "is not a valid #{manufacturer.name} model")
  end
end

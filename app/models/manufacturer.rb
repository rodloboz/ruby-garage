class Manufacturer < ApplicationRecord
  has_many :models

  validates :name, presence: true,
                   uniqueness: true

  def self.options_for_select
    pluck(:name).sort
  end
end

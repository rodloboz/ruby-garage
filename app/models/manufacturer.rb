class Manufacturer < ApplicationRecord
  has_many :models

  validates :name, presence: true,
                   uniqueness: true

  scope :search_by_name, lambda { |term| 
    where('name ILIKE ?', "#{term}%")
  }

  def self.options_for_select
    pluck(:name).sort
  end
end

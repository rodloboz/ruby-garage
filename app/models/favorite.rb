class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :car

  counter_culture :car, column_name: 'favorited_count'

  validates :user, uniqueness: { scope: :car }
end

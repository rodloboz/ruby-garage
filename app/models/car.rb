class Car < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :model
end

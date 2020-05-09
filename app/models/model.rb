class Model < ApplicationRecord
  belongs_to :manufacturer

  validates :name, presence: true,
                   uniqueness: { scope: :manufacturer }

  def self.options_for_select
    pluck(:name).sort
  end
end

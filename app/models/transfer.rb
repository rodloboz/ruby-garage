class Transfer
  include ActiveModel::Model

  attr_accessor :car, :new_owner

  validates :car, :new_owner, presence: :true

  validate :new_ownership

  def save
    return false if invalid?

    car.update(owner: new_owner)
  rescue ActiveRecord::Rollback
    false
  end
  alias_method :save!, :save

  private

  def new_ownership
    return unless car.owner == new_owner

    errors.add :new_owner, 'is the same as the current owner'
  end
end
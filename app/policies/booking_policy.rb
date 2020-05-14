class BookingPolicy < ApplicationPolicy
  def create?
    user.present? && !user_owns_car?
  end

  private

  def user_owns_car?
    record.car.owner == user
  end
end

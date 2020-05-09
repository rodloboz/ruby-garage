class CarPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    user_owns_car?
  end

  def destroy?
    user_owns_car?
  end

  private

  def user_owns_car?
    record.owner == user
  end
end

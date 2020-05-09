class TransferPolicy < ApplicationPolicy
  def create?
    current_owner == user
  end

  private

  def current_owner
    record.car&.owner
  end
end

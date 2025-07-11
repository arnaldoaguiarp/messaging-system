class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def inactivate?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end

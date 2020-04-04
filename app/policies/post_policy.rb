class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def destroy?
    record.user == user
  end

  private

  def is_allowed?
    record.user == user || admin == user
  end
end

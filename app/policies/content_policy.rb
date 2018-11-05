class ContentPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      scope.where(user: user)
    end
  end

  def update?
    true
  end
end

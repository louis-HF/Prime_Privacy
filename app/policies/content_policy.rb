class ContentPolicy < ApplicationPolicy
  class Scope < Scope

    def initialize(user)
      @user = :user
    end

    def resolve
      scope.where(user: @user)
    end
  end

  def update?
    true
  end
end

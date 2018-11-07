class KeywordPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.topic.where(topic: {user:  [user, nil]})
    end
  end

  def destroy?
    record.user == user
  end
end

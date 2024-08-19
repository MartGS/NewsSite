module StepsControllers
  class ArticleStepsPolicy < ApplicationPolicy
    def show?
      user.present?
    end

    def update?
      user.present? && record.user_id == user.id
    end

    class Scope < ApplicationPolicy::Scope
    end
  end
end

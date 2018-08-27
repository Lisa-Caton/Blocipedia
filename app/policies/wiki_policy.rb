class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    true
     user.admin? || user.id == wiki.user_id
  end

  def destroy?
    true
  end

end

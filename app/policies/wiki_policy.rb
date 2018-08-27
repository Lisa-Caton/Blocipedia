class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

 def initialize(user, wiki)
   @user = user
   @wiki = wiki
 end

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
     user.standard? || user.admin? || user.premium?
  end

  def destroy?
    true
  end

end

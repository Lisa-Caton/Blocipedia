class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

 def initialize(user, wiki)
   @user = user
   @wiki = wiki
 end

  def index?
    user.present?
  end

  def create?
    user.present?
  end

  def show?
    user.present? unless @wiki.private && @user.standard?
  end

  def update?
    user.present? unless @user.standard?
  end

  def destroy?
    user.admin? if user
  end

  def new?
    user.present?
  end

end

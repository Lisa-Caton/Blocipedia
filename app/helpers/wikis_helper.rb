module WikisHelper

  def user_is_authorized_for_private?
    current_user.premium? || current_user.admin?
  end

  def user_is_authorized_for_edit?
    current_user
  end

  def user_is_authorized_for_delete?
    current_user && current_user.admin?
  end

  def user_is_authorized_for_collaborator_edit?
    @wiki.user || current_user.premium?
  end

  def wiki_has_collaborators?
    @wiki.collaborators.any?
  end
end

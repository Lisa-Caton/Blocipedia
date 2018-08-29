class UsersController < ApplicationController

  def premium_to_standard
    current_user.update_attributes(role: 'standard')
    redirect_to edit_user_registration_path
  end

  def standard_to_premium
    current_user.update_attributes(role: 'premium')
    redirect_to edit_user_registration_path
  end

end

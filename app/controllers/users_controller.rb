class UsersController < ApplicationController

  def create
    @user = User.new
    @user.username = params[:user][:username]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      flash[:notice] = "Welcome to Bloccit #{@user.name}!"
      create_session(@user)
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error creating your account. Please try again."
      render :new
    end
  end

  def premium_to_standard
    current_user.update_attributes(role: 'standard')
    redirect_to edit_user_registration_path
  end

  def standard_to_premium
    current_user.update_attributes(role: 'premium')
    redirect_to edit_user_registration_path
  end

end

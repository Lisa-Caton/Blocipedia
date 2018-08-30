class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  include Pundit
  #This will include all the 'pundit' methods
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to request.referrer
  end

end

class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  include Pundit
  protect_from_forgery with: :exception

  #This will include all the 'pundit' methods

  private
  

end

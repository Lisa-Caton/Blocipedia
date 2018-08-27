class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  include Pundit
  #This will include all the 'pundit' methods

  protect_from_forgery with: :exception

end

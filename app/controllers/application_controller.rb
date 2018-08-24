class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  protect_from_forgery with: :exception
  include Pundit
  #This will include all the 'pundit' methods



end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :remove_medium_id

  def remove_medium_id
    session[:medium_id] = nil if controller_name != 'articles'
  end
end

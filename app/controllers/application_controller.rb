class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success

  private 
  def logged_in?
    current_user
  end
  helper_method :logged_in?


  def current_user
  	@currect_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def require_user
  	if current_user
  		true
  	else
  		redirect_to new_user_session_path, notice: "Jump to Login page. You must be logged in."
  	end

  end
end

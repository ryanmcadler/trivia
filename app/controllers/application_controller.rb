class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by_authtoken(cookies[:authtoken]) if cookies[:authtoken]
  end

  def authorize
    unless current_user
    	redirect_to root_url, notice: "Please login."
    end
  end
    	
end

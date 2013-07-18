class SessionsController < ApplicationController

  def new
  end

  def create
    newuser = false
    @user = User.create_with(newuser: true).find_or_create_by_email(params[:email])
    if @user.save
      cookies[:authtoken] = @user.authtoken
      redirect_to pages_index_path
    else
      redirect_to root_url, notice: "The email provided is invalid."
    end
  end

  def destroy
    cookies.delete(:authtoken)
    redirect_to root_url, notice: "Logged-out."
  end
  
end

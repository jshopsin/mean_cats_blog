class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  # login
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to root_url, notice: "#{@user.username} is logged in!"
    else
      redirect_to new_session_path, notice: "Email or password is invalid."
    end
  end

  # LOGOUT
  def destroy
    current_user = session[:current_user_id] = nil
    redirect_to root_url, notice: "You are logged out!"
  end
end
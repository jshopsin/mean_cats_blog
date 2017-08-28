class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    redirect_to "categories#index"
  end

  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end
  helper_method :current_user

  def authorize
    redirect_to root_path unless current_user
  end
end

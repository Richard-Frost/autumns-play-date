class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate_user!, :is_parent?

  def home
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] 
  end

  def logged_in?
    !!current_user
  end 

  def authenticate_user!
    if !logged_in
      redirect_to new_session_path if !logged_in?
    end
  end

  def is_parent?
    current_user.parent if current_user
  end

  def redirect_if_not_admin!
    redirect_to '/' if !is_parent?
  end

end





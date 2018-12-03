class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate_user!, :is_parent?, :connected?, :my_family

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

  def my_family
    current_user.family.id
  end

  def connected?
    !!FamilyConnection.find_by(family_id: my_family, famconnect_id: params[:id]) || !!FamilyConnection.find_by(family_id: params[:id], famconnect_id: my_family)
  end

  def playdates_near_me
    geo = Geocoder.search(11215)
    geo1 = geo.first
    lat = geo1.latitude
    lon = geo1.longitude
    distance = 10
    center_point = [lat, lon]
    box = Geocoder::Calculations.bounding_box(center_point, distance)
    Playdate.within_bounding_box(box)
  end

  def families_near_me
    geo = Geocoder.search(11215)
    geo1 = geo.first
    lat = geo1.latitude
    lon = geo1.longitude
    distance = 10
    center_point = [lat, lon]
    box = Geocoder::Calculations.bounding_box(center_point, distance)
    Family.within_bounding_box(box)
  end



end





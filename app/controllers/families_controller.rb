class FamiliesController < ApplicationController
  
  def index
    @families = Family.all
  end

  def new 
    @family = Family.new
    @family.children.build
    @family.users.build
    @titles = ["Parent", "Grandparent", "Babysitter", "Nanny", "Other"]
  end

  def create
    @family = Family.new(family_params)
    @family.save
    @user = User.find_by_email(params[:family][:users_attributes]["0"][:email])
    session[:user_id] = @user.id
    redirect_to family_path(@family.id)
  end

  def show
    @family = Family.find(params[:id])
    @request = Request.new
  end

  def settings
    @user = current_user
    @family = current_user.family
  end

  def update
    @family = current_user.family
    @family.update(update_params)
    redirect_to family_path(current_user.id)
  end

private

  def geo
    Geocoder.search(11215).first
  end

  def family_params
    params.require(:family).permit(:email, :password,:name, :zipcode, users_attributes: [:first_name, :last_name, :email,:password, :title], children_attributes: [:name, :age]).merge(latitude: geo.latitude, longitude: geo.longitude)
  end

  def update_params
    params.require(:family).permit(:email, :password, :zipcode, users_attributes: [:first_name, :last_name,  :email,:password, :id, :title], children_attributes: [:name, :age, :id]).merge(latitude: geo.latitude, longitude: geo.longitude)
  end
 
end

class FamiliesController < ApplicationController
  

  def index
  end

  def new 
    @family = Family.new
    @family.children.build
    @family.users.build
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
  end

  def settings
    @user = current_user
    @family = current_user.family
    @new_user = User.new
    @new_child = Child.new
  end

private

  def family_params
    params.require(:family).permit(:email, :password, users_attributes: [:name, :email,:password], children_attributes: [:name, :age])
  end

end

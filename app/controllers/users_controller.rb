class UsersController < ApplicationController

def new
  @user = User.new
  me = User.find(session[:user_id])
  @family = me.family
end

def create
  @user = User.new(user_params)
  @user.save
  @user.send_family_invite
  redirect_to family_path(@user.family.id)
end

def update
end

private

def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password, :family_id)
end

end

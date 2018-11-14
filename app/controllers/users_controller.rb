class UsersController < ApplicationController

def new
  @user = User.new
  @family = current_user.family
end

def create
  @user = User.new(user_params)
  @user.save
  @user.send_family_invite
  redirect_to family_path(@user.family.id)
end

def update
end

def home
  @family = Family.find(current_user.family.id)
end

private

def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password, :family_id)
end

end

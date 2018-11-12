class UserActivationsController < ApplicationController

  def new
  end

  def edit
    binding.pry
    @user = User.find_by(password_reset_token: params[:id])
  end

  def update
    binding.pry
    @user = User.find_by_password_reset_token(params[:id])
    @user.update(reset_params)

      redirect_to '/login', :notice => "Password has been reset" 
  end

  private

  def reset_params
    params.require(:user).permit(:password)
  end

end
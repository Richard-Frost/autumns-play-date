class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:user][:email])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = user.id
    @user = user
    redirect_to "/families/#{@user.family.id}"
  
    #family = Family.find_by(email: params[:family][:email])
    #family = family.try(:authenticate, params[:family][:password])
    #return redirect_to(controller: 'sessions', action: 'new') unless family
    #session[:user_id] = family.id
    #@family = family
    #redirect_to "/families/#{@family.id}"
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end

end
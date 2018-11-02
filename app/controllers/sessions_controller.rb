class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    family = Family.find_by(email: params[:family][:email])
    family = family.try(:authenticate, params[:family][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless family
    session[:family_id] = family.id
    @family = family
    redirect_to "/families/#{@family.id}"
  end

  def destroy
    session.delete :family_id
    redirect_to '/login'
  end




end
class RequestsController < ApplicationController

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    redirect_to '/home'
  end

  def index
    @requests = current_user.family.requests
  end

  def destroy
  end

  private

  def request_params
    params.permit(:family_id, :famconnect_id)
  end

end

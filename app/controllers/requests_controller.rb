class RequestsController < ApplicationController

  def new
    @request = Request.new
  end

  def create
    request = Request.create(request_params)
    binding.pry
    redirect_to home_path
  end

  def index
    @requests = Request.all.where(famconnect_id: my_family)
  end

  def destroy
  end

  def update 
    req = Request.find(params[:id])
    if accept
      FamilyConnection.create(family_id: req.family_id, famconnect_id: req.famconnect_id)
      FamilyConnection.create(family_id: req.famconnect_id, famconnect_id: req.family_id)
      req.delete
    else
      req.delete
    end
    redirect_to '/requests'
  end

  private

  def request_params
    params.require(:request).permit(:family_id, :famconnect_id, :message)
  end

  def accept
    params[:button_action] == "accept"
  end


end

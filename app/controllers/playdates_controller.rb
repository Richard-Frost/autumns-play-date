class PlaydatesController < ApplicationController

  before_action :require_login

  def index
    @playdates = Playdate.all
  end

  def new
    @playdate = Playdate.new
    @family = Family.find(my_family)
  end

  def create
    @playdate = Playdate.new(playdate_params)
    @playdate.originator = session[:user_id]
    @playdate.save

    params[:playdate][:participants].each do |id|
      Participant.create(playdate_id: @playdate.id, child_id: id)
    end
    redirect_to playdate_path(@playdate.id)
  end

  def show
    @playdate = Playdate.find(params[:id])
    @originator = User.find(@playdate.originator)
    @family = current_user.family
  end

  def edit
    @playdate = Playdate.find(params[:id])
    @family = Family.find(my_family)
  end

  def update
    @playdate = Playdate.find(params[:id])
    @playdate.update(playdate_params)
    redirect_to playdate_path(@playdate.id)
  end

 
 
  private

  def playdate_params
    params.require(:playdate).permit(:name, :datetime, :location, :description, :originator)
  end

end

class PlaydatesController < ApplicationController

  def index
  end

  def new
    @playdate = Playdate.new
    @family = Family.find(session[:family_id])
  end

  def create
    @playdate = Playdate.new(playdate_params)
    @playdate.originator = session[:family_id]
    @playdate.save
    params[:playdate][:participants].each do |id|
      Participant.create(playdate_id: @playdate.id, child_id: id)
    end
    redirect_to playdate_path(@playdate.id)
  end

  def show
    @playdate = Playdate.find(params[:id])
  end

  private

  def playdate_params
    params.require(:playdate).permit(:datetime, :location, :description, :originator)
  end

  

end

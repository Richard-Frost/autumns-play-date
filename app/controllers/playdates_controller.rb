class PlaydatesController < ApplicationController

  before_action :require_login

  def index
    @playdates = Playdate.all
  end

  def new
    @playdate = Playdate.new
    @family = Family.find(session[:user_id])
    @options = [parent, other]
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
  end

  private

  def playdate_params
    params.require(:playdate).permit(:name, :datetime, :location, :description, :originator)
  end
 
  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end

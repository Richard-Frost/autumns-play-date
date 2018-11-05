class FamiliesController < ApplicationController
  

  def index
  end

  def new 

    @family = Family.new
    @family.children.build
    @family.parents.build
  end

  def create
    @family = Family.new(family_params)
    @family.save
    session[user_id] = @family.id
    redirect_to family_path(@family.id)
  end

  def show
    @family = Family.find(params[:id])
    if current_user != @family
      redirect_to '/'
    end
  end

private

  def family_params
    params.require(:family).permit(:email, :password, parents_attributes: [:name, :email,:password], children_attributes: [:name, :age])
  end

end

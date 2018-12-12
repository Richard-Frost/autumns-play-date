class ChildrenController < ApplicationController
 
  def edit
  end

  def update
    @child = Child.find_by(id: params[:id])
    @child.update(child_params)
    redirect_to home_path
  end

  private

  def child_params
    params.require(:child).permit(:bored)
  end
  
end
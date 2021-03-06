class CommentsController < ApplicationController


  def create
    Comment.create(comment: params[:playdates][:comment], user_id: current_user.id, playdate_id: params[:playdate_id])
    redirect_to playdate_path(params[:playdate_id])
  end 

  def edit
   @comment = Comment.find(params[:id])
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user_id == current_user.id 
    redirect_to playdate_path(params[:playdate_id])

  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    binding.pry
    redirect_to playdate_path(params[:playdate_id])
  end

private

  def comment_params
    params.require(:comment).permit(:comment, :playdate_id, :id)
  end
end




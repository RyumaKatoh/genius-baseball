class CommentsController < ApplicationController
  def create
    if user_signed_in?
      comment = Comment.create(comment_params)
      redirect_to "/practices/#{comment.practice.id}"
    else 
      redirect_to user_session_path 
    end   
  end
  def destroy
    comment = Comment.find(params[:id])
    @practice = Practice.find(params[:practice_id])
    if user_signed_in? && comment.practice_id == @practice.id && comment.user_id == current_user.id
      comment.destroy
      redirect_to practice_path(comment.practice.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :video).merge(practice: Practice.find(params[:practice_id]), user_id: current_user.id)
  end
end

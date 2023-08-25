class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/practices/#{comment.practice.id}"
  end
  def destroy
    comment = Comment.find(params[:id])
    @practice = Practice.find(params[:id])
    if user_signed_in? && @practice.comment.user_id == current_user.id
      comment.destroy
      redirect_to practice_path(@practice.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :video).merge(practice: Practice.find(params[:practice_id]), user_id: current_user.id)
  end
end

class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/practices/#{comment.practice.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :video).merge(practice: Practice.find(params[:practice_id]), user_id: current_user.id)
  end
end

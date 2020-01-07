class CommentsController < ApplicationController

  def create
    @comment=Comment.new(comment_params)
	if @comment.save
		redirect_to posts_path
	end
  end

  def comment_params
    params.require(:comment).permit(:user_id,:body,:post_id)
  end
end

class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_comment = PostComment.find(params[:post_comment_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.study_time_id = @post_comment.id
    @post_comment.save
  end

  def destroy
    @post_comment = PostComment.find(params[:post_comment_id])
    comment = @post_comment.comments.find(params[:id])
    comment.destroy
  end

  private

  def comment_params
    params.require(:post_comment).permit(:comment)
  end
end

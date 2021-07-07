class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @study_time = StudyTime.find(params[:study_time_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.study_time_id = @study_time.id
    @post_comment.user_id = current_user.id
    @post_comment.save
    redirect_to request.referer
  end

  def destroy
    @study_time = StudyTime.find(params[:study_time_id])
    post_comment = @study_time.post_comments.find(params[:id])
    if
    post_comment.destroy
      redirect_to request.referer
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end

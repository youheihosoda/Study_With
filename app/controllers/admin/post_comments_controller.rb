class Admin::PostCommentsController < ApplicationController

  def destroy
    @study_time = StudyTime.find(params[:study_time_id])
    post_comment = @study_time.post_comments.find(params[:id])
    if
    post_comment.destroy
    redirect_to request.referer
    end
  end

  

end

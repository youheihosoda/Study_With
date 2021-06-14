class Public::StudyTimesController < ApplicationController

 def create
  @study_time = StudyTime.new(study_time_params)
  @state = params[:event]
  return redirect_to public_posts_path if ((@state == "start") && (params[:start] == "start"))
  @study_time.start_time = Time.now
  @study_time.user_id = current_user.id
  # @study_time.post_id =
  @study_time.save
  @user = current_user
  render template: 'public/posts/index'
 end

 def update
  @study_time = StudyTime.find(params[:id])
  return redirect_to public_users_path if ((@state == "end") && (params[:event] == "end"))
  @state = params[:event]
  @study_time.update(end_time: Time.now)
  @user = current_user
  redirect_to new_public_post_path
 end

 private
  def study_time_params
    # params.require(:study_time).permit(:user)
  end


end

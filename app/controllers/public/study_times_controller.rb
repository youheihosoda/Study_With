class Public::StudyTimesController < ApplicationController

 def start_time
  @study_time = StudyTime.new
  @state = params[:event]
  return redirect_to top_public_study_times_path if ((@state == "start") && (params[:start] == "start"))
  @study_time.start_time = Time.now.to_i
  @study_time.user_id = current_user.id
  @study_time.save
  @user = current_user
  @study_times = StudyTime.where.not(end_time:nil)
  render template: 'public/study_times/top'
 end

 def stop_time
  @study_time = StudyTime.find(params[:id])
  return redirect_to public_users_path if ((@state == "end") && (params[:event] == "end"))
  @state = params[:event]
  @study_time.update(end_time: Time.now.to_i)
  @user = current_user
  redirect_to edit_public_study_time_path(study_time_id:params[:id])
 end

 def update
  @user = current_user
  @study_time = StudyTime.find(params[:id])
  @study_time.update(study_method: params[:study_form][:study_method], learning_detail_id:  params[:study_form][:learning_detail_id])
 # 写真が投稿されないと投稿できない
  @study_time.photos.destroy_all
  params[:study_form][:photo_images].each do |post_image|
  @study_time.photos.create!(image: post_image)
  end

  params[:study_form][:study_text_ids].delete_at(0)
  text_ids =  params[:study_form][:study_text_ids]

  text_ids.each do |text_id|
   @study_time.study_time_texts.create!(study_text_id: text_id)
  end

  redirect_to top_public_study_times_path
 end

 def new
   @study_time = StudyTime.find_by(params[:study_time_id])
 end

def top
  @user = current_user
  @study_time = StudyTime.new
  @study_times = StudyTime.all
  @learning_details = LearningDetail.all

end

def edit
  @study_time = StudyTime.find(params[:id])
  @learning_details = LearningDetail.all
  @study_texts = StudyText.all
  @study_form = StudyForm.new
end

 def destroy
  @user = current_user
  @study_time = StudyTime.find(params[:id])
  @study_time.destroy
  redirect_to top_public_study_times_path
 end

 private
  def study_time_params
    params.permit(:study_method,:study_text_ids, :study_time_id,:learning_detail_id, photos_images:[])
  end

end

class Public::StudyTimesController < ApplicationController

 def index
  @day = params[:day] ? Date.parse(params[:day]) : Time.zone.today
  beginning_of_month = @day.beginning_of_month
  end_of_month = @day.end_of_month
  @study_times = StudyTime.where("updated_at >= ? and updated_at <= ? ", beginning_of_month, end_of_month).where(user_id: current_user.id).where.not(end_time:nil).where.not(learning_detail:nil)
  @study_time_hash = {}
  @study_times.each do |study_time|
   if @study_time_hash[study_time.learning_detail.detail]
    @study_time_hash[study_time.learning_detail.detail] = @study_time_hash[study_time.learning_detail.detail]+study_time.learning_time
   else
    @study_time_hash[study_time.learning_detail.detail] = study_time.learning_time
   end
 end

  @study_time_array = []
  @study_time_hash.each do |k,v|
   @study_time_array.push([k,v])
  end
 end

 def start_time
  @study_time = StudyTime.new
  @state = params[:event]
  return redirect_to top_public_study_times_path if ((@state == "start") && (params[:start] == "start"))
  @study_time.start_time = Time.now.to_i
  @study_time.user_id = current_user.id
  @study_time.save
  @user = current_user
  @study_times = StudyTime.where.not(end_time:nil).where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc).page(params[:page]).per(10)

  render template: 'public/study_times/top'
 end

 def show
  @study_time = StudyTime.find(params[:id])
  @post_comment = PostComment.new
 end

 def stop_time
  @study_time = StudyTime.find(params[:id])
  return redirect_to public_users_path if ((@state == "end") && (params[:event] == "end"))
  @state = params[:event]
  @study_time.update(end_time: Time.now.to_i, learning_time: @study_time.end_time.to_i-@study_time.start_time.to_i)
  @study_time.update(learning_time: (@study_time.end_time.to_i-@study_time.start_time.to_i)/60.floor)
  # @study_time.update(learning_time: @study_time.end_time.to_i-@study_time.start_time.to_i)
  @user = current_user
  redirect_to edit_public_study_time_path(study_time_id:params[:id])
 end

 def update
  @user = current_user
  @study_time = StudyTime.find(params[:id])
  @study_time.update(study_method: params[:study_form][:study_method], learning_detail_id:  params[:study_form][:learning_detail_id])



  @study_time.photos.destroy_all
  if params[:study_form][:photo_images].present?
    if params[:study_form][:photo_images].count >= 5
      redirect_to edit_public_study_time_path
      return
    elsif
      params[:study_form][:photo_images].each do |post_image|
        @study_time.photos.create!(image: post_image)
      end
    end
  end

  params[:study_form][:study_text_ids].delete_at(0)
  text_ids =  params[:study_form][:study_text_ids]

  text_ids.each do |text_id|
   @study_time.study_time_texts.create!(study_text_id: text_id)
  end
  redirect_to top_public_study_times_path
 end

def top
  @user = current_user
  @study_time = StudyTime.new
  @study_times = StudyTime.where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc).where.not(end_time:nil).page(params[:page]).per(10)
  @learning_details = LearningDetail.all

end

def edit
  @study_time = StudyTime.find(params[:id])
  @learning_details = LearningDetail.where(user_id: current_user.id)
  @study_texts = StudyText.where(user_id: current_user.id)
  @study_form = StudyForm.new
  @study_text = StudyText.new
  @learning_detail = LearningDetail.new
end

 def destroy
  @user = current_user
  @study_time = StudyTime.find(params[:id])
  @study_time.destroy
  redirect_to request.referer
 end


 private
  def study_time_params
    params.permit(:study_method,:study_text_ids, :study_time_id,:learning_detail_id, photos_images:[])
  end


end

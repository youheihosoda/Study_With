class Public::UsersController < ApplicationController

def index
  @user = current_user
  @study_time = StudyTime.new
end

def show
  @user = User.find(params[:id])
  @study_times = @user.study_times.order(created_at: :desc).where.not(end_time:nil)
  study_time_ids = current_user.study_times.map {|study_time|  study_time.id}
  @study_texts  = StudyTimeText.where(study_time_id: study_time_ids).group(:study_text_id).select('study_text_id,study_time_id,count(study_time_id)as count').order('count').limit(3).map { |item| item.study_text }
  @learning_details = LearningDetail.all
end

def edit
  @user = User.find(params[:id])
  @study_text = StudyText.new
  @learning_detail = LearningDetail.new
  @study_texts = StudyText.where(user_id: current_user.id)
  @learning_details = LearningDetail.where(user_id: current_user.id)
   if @user!=current_user
    redirect_to public_users_path(current_user)
   end
end

def update
  @user = User.find(params[:id])
 if @user.update(user_params)
  redirect_to public_user_path(@user.id), notice: "You have updated user successfully."
 else
  redirect_to request.referer
 end
end

  def unsubscribe
    @user = current_user
  end

def withdrawal
  @user = current_user
    #現在ログインしているユーザーを@userに格納
  @user.update(is_deleted: true)
    #updateで登録情報をInvalidに変更
  reset_session
    #sessionIDのresetを行う
  redirect_to root_path
    #指定されたrootへのpath
end


private
def user_params
  params.require(:user).permit(:name, :introduction, :profile_image,:study_text_id)
end


end

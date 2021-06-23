class Public::UsersController < ApplicationController

def index
  @user = current_user
  @study_time = StudyTime.new
end

def show
  @user = User.find(params[:id])
  @study_times = @user.study_times
  @learning_details = LearningDetail.all
end

def edit
  @user = User.find(params[:id])
  @study_text = StudyText.new
  @learning_detail = LearningDetail.new
  @study_texts = StudyText.all
  @learning_details = LearningDetail.all
   if @user!=current_user
    redirect_to public_users_path(current_user)
   end
end

def update
  @user = User.find(params[:id])
 if @user.update(user_params)
  redirect_to public_posts_path(@user.id), notice: "You have updated user successfully."
 else
  render "edit"
 end
end

def unsubscribe

end

def withdrawal
  @user = current_user
    #現在ログインしているユーザーを@userに格納
  @user.update(withdrawal: true)
    #updateで登録情報をInvalidに変更
  reset_session
    #sessionIDのresetを行う
  redirect_to root_path
    #指定されたrootへのpath
end


def create
end

private
def user_params
  params.require(:user).permit(:name, :introduction, :profile_image,:study_text_id)
end


end

class Admin::UsersController < ApplicationController


def index
 @users = User.all.order(created_at: :desc)
end

def show
  @user = User.find(params[:id])
  @is_deleted = @user.is_deleted
  @study_times = @user.study_times
  @learning_details = LearningDetail.all
end

def destroy

end

def withdrawal
  @user = User.find(params[:user_id])
  if @user.is_deleted == false
    @user.update(is_deleted: true)
    reset_session
  else
    @user.update(is_deleted: false)
  end
  redirect_to request.referer
end

private
def user_params
  params.require(:user).permit(:name, :introduction, :profile_image,:study_text_id)
end
end
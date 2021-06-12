class Public::UsersController < ApplicationController

def index
  @user = current_user
  @study_time = StudyTime.new
end

def show
end

def edit
  @user = User.find(params[:id])
   if @user!=current_user
    redirect_to public_users_path(current_user)
   end
end

def update
  @user = User.find(params[:id])
 if @user.update(user_params)
  redirect_to public_users_path(@user.id), notice: "You have updated user successfully."
 else
  render "edit"
 end
end

def unsubscribe
end

def withdraw
end

def fllowing
end

def fllowers
end

def create
  # params[:event] == "start"
  @study_time = StudyTime.new
  @study_time.start_time = Time.now
  @study_time.user_id = current_user.id
  # @study_time = StudyTime.where(user_id: current_user.id , end_time: nil).where.not(start_time: nil).first
  if @study_time.start_time != nil
   @study_time.end_time = Time.now
  else
   # 保存せずエラーにするとか。
   @study_time = StudyTime.new
   @study_time.start_time = Time.now
   @study_time.user_id = current_user.id
  end
   @study_time.save

  if @study_time.save
  redirect_to public_users_path
  else
   redirect_to edit_public_user_path(current_user.id)
  end
end

private
def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
end


end

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
  redirect_to public_posts_path(@user.id), notice: "You have updated user successfully."
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

end

private
def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
end


end

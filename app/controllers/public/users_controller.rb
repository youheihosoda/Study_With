class Public::UsersController < ApplicationController

def index
  @user = current_user
  @start_time = Time.now
  @end_time = Time.now
  @count_time = @end_time - @start_time
  @timeFloat = @t.to_f
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
@count_time = CountTime.new
@count_time_user.id = current_user.id
@count_time.save
 redirect_to public_users_path
end

private
def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
end


end

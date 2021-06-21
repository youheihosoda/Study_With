class Public::RelationshipsController < ApplicationController

  before_action :authenticate_user!
  def create
    current_user.follow(params[:follow_id])
    redirect_to request.referer
  end
  def destroy
    current_user.unfollow(params[:follow_id])
    redirect_to request.referer
  end
  # followings, followersは省略
  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
  end

  def followers
     @user = User.find(params[:user_id])
     @users = @user.followers
  end
end


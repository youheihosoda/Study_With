class Admin::UsersController < ApplicationController
end

def index
  @user = User.find(user_params_id)
  @users = User.all
end
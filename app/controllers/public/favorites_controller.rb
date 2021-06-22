class Public::FavoritesController < ApplicationController
   before_action :authenticate_user!

  def create
    @study_time = StudyTime.find(params[:study_time_id])
    favorite = @study_time.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @study_time = StudyTime.find(params[:study_time_id])
    favorite = @study_time.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    redirect_to request.referer
  end

end

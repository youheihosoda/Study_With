class Admin::StudyTimesController < ApplicationController

  def destroy
    @study_time = StudyTime.find(params[:id])
    @study_time.destroy
    redirect_to request.referer
  end
  
  def show
    @study_time = StudyTime.find(params[:id])
  end
  
end

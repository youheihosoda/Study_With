class Public::LearningDetailsController < ApplicationController
  def create
    @user = current_user
    @learning_detail = LearningDetail.new(learning_detail_params)
    @learning_detail.user_id = current_user.id
    @learning_detail.save
    @learning_details = LearningDetail.all
    redirect_to request.referer
  end

  def destroy
    @user = current_user
    @learning_detail = LearningDetail.find(params[:id])
    @learning_detail.destroy
    redirect_to edit_public_user_path(@user.id)
  end

  private

  def learning_detail_params
    params.require(:learning_detail).permit(:user_id, :detail, :study_time)
  end
end

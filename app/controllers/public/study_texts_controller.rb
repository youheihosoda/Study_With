class Public::StudyTextsController < ApplicationController

 def create
  @user = current_user
  @study_text = StudyText.new(study_text_params)
  @study_text.user_id = current_user.id
  @study_text.save
  @study_texts = StudyText.all
  redirect_to request.referer
 end

 def destroy
  @user = current_user
  @study_text = StudyText.find(params[:id])
  @study_text.destroy
  redirect_to edit_public_user_path(@user.id)
 end

 private
  def study_text_params
   params.require(:study_text).permit(:name,:user_id)
  end
end

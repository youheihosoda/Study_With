class Public::PohotosController < ApplicationController
  def create
    @photo = Photo.new(photo_params)
    @photo.save
  end

  def destroy
  end

  private

  def photos_params
    params.require(:photo).permit(:image_id, :study_time_id)
  end
end

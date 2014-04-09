class TagsController < ApplicationController
  def create
    @photo = Photo.find(params[:tag][:photo_id])
    @tag = Tag.create(strong)
    redirect_to photo_path(@photo)
  end


  private

  def strong
    params.require(:tag).permit(:photo_id, :user_id)
  end
end

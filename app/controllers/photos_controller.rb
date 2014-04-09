class PhotosController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def index
    @photos = Photo.all
  end

  def create
    @user = current_user
    @photo = @user.photos.create(strong)
    @tag = Tag.find_by_photo_id(@photo.id)
    @tag.update({ owner: true })
    redirect_to user_path(@user)
  end


  private

  def strong
    params.require(:photo).permit(:title, :img)
  end
end

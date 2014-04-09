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

  def show
    @tag = Tag.new
    @photo = Photo.find(params[:id])
    @user = User.find(Tag.all.where(photo_id: @photo.id, owner: true).first.user_id)
    @new_array = (User.all - [@user]).map { |user| user}
    @user_array = @new_array.map { |user| [user.name, user.id]}
  end

  private

  def strong
    params.require(:photo).permit(:title, :img)
  end
end

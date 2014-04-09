class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(strong)
    if @user.save
      session[:user_id] = @user.id
      redirect_to photos_path, notice: 'Logged in successfully!'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @photo = Photo.new
    @owner_photos = []
    @owner = @user.tags.where({ :owner => true })
    @owner.each do |tag|
      @owner_photos << Photo.find(tag.photo_id)
    end
    @tagged = @user.photos - @owner_photos

  end


  private

  def strong
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

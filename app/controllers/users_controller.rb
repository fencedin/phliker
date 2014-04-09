class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(strong)
    if @user.save
      session[:user_id] = @user.id
      redirect_to photos_path
    else
      render 'new'
    end
  end


  private

  def strong
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end

class PhotosController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def index
    @photos = Photo.all
  end
end

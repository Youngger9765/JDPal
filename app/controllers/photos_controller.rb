class PhotosController < ApplicationController

  before_action :correct_user
  before_action :find_photo,  only: [:show, :edit, :update, :destroy, :like]
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]

  def index
    @photos = @user.photos.all
  end

  def new
    if @user.photos.size > 4
      flash[:alert] = "照片滿載!"
      redirect_to user_path(@user)
    else
      @photo = Photo.new
    end
    
  end

  def create
    @user.photos.create(photo_params)

    redirect_to user_path(@user)
  end 

  def update
    
  end

  def edit
    @photos = @user.photos.all
  end

  def destroy
    
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end

  def correct_user
    @user = current_user
  end

  def find_photo
    @photo = Photo.find(params[:id])
  end


end

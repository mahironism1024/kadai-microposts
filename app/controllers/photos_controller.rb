class PhotosController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @photos = Photo.order(id: :desc).page(params[:page]).per(25)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    
    if @photo.save
      flash[:success] ="画像のアップロードに成功しました。"
      redirect_to root_path
    else
      flash.now[:danger] = "画像のアップロードに失敗しました。"
      render :new
    end
  end

  private
  
  def photo_params
    params.fetch(:photo,{}).permit(:image)
  end
end

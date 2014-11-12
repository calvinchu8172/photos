class PhotosController < ApplicationController

before_action :authenticate_user!, :except => [:new]


def index
  #@photos = Photo.page(params[:page]).per(5)
  @photos = Photo.all
end


def new
  @photo = Photo.new
end

def create
  @photo = Photo.new(photo_params)
  @photo.save

  redirect_to photos_url
end

def show
  @photo = Photo.find(params[:id])
  if @photo.user == current_user
    @page_title = @photo.name
  else
    redirect_to root_path
  end
end

def edit
  @photo = Photo.find(params[:id])
end

def update
  @photo = Photo.find(params[:id])
  @photo.update(photo_params)

  redirect_to photos_url(@photo)
end

def destroy
  @photo = Photo.find(params[:id])
  @photo.destroy

  redirect_to photos_url
end



private

def photo_params
  params.require(:photo).permit(:name, :comment, :logo)
end

end

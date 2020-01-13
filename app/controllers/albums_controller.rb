class AlbumsController < ApplicationController

  # Code for listing all albums
  def index
    @albums = Album.all
    render :index
  end

  # Code for new album form
  def new
    @album = Album.new
    render :new
  end

  # Code for creating a new album
  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to albums_path
    else
      render :new
    end
  end

  # Code for edit album form
  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  # Code for showing a single album
  def show
    @album = Album.find(params[:id])
    render :show
  end

  # Code for updating an album
  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to albums_path
    else
      render :edit
    end
  end

  # Code for deleting an album
  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  private
    def album_params
      params.require(:album).permit(:name, :genre)
    end

end

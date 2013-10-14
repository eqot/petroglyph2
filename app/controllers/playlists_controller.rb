class PlaylistsController < ApplicationController
  before_action :get_playlist, only: [:show, :edit, :update, :destroy]

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = current_user.playlists.build(playlist_params)
    if @playlist.save
      redirect_to playlists_path
    else
      render 'new'
    end
  end

  def index
    @playlists = Playlist.paginate(page: params[:page])
  end

  def show
    @videos = @playlist.contained_videos.paginate(page: params[:page])
  end

  def edit
  end

  def update
    if @playlist.update_attributes(playlist_params)
      flash[:success] = 'Playlist updated.'
      redirect_to @playlist
    else
      render 'edit'
    end
  end

  def destroy
    @playlist.destroy
    flash[:success] = 'Playlist deleted.'
    redirect_to playlists_url
  end

  private

    def playlist_params
      params.require(:playlist).permit(:title, :description)
    end

    def get_playlist
      @playlist = Playlist.find(params[:id])
    end

end

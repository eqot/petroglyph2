class PlaylistsController < ApplicationController
  before_action :get_playlist, only: [:show]

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
  end

  private

    def playlist_params
      params.require(:playlist).permit(:title, :description)
    end

    def get_playlist
      @playlist = Playlist.find(params[:id])
    end

end

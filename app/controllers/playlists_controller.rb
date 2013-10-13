class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.paginate(page: params[:page])
  end

end

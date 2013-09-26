class VideosController < ApplicationController

  def index
    @videos = Video.paginate(page: params[:page])
  end

end

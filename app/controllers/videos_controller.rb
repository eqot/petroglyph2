class VideosController < ApplicationController

  def new
    @video = Video.new
  end

  def create
    @video = current_user.videos.build(video_params)
    if @video.save
      redirect_to videos_path
    else
      render 'new'
    end
  end

  def index
    @videos = Video.paginate(page: params[:page])
  end

  private

    def video_params
      params.require(:video).permit(:url, :title, :description)
    end

end

class VideosController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :destroy]

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

  def show
    @video = Video.find(params[:id])
  end

  def destroy
    Video.find(params[:id]).destroy
    flash[:success] = "Video deleted."
    redirect_to videos_url
  end

  private

    def video_params
      params.require(:video).permit(:url, :title, :description)
    end

end

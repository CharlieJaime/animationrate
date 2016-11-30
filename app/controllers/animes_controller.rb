class AnimesController < ApplicationController
  before_action :find_anime, only: [:show, :edit, :update, :destroy]

  def index
    @animes = Anime.all.order("created_at DESC");
  end

  def show
  end

  def new
    @anime = Anime.new
  end

  def create
    @anime = Anime.new(anime_params)

    if @anime.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private
  def anime_params
    params.require(:anime).permit(:title, :description, :creator)
  end

  def find_anime
    @anime = Anime.find(params[:id]);
  end
end

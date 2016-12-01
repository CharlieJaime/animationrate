class AnimesController < ApplicationController
  before_action :find_anime, only: [:show, :edit, :update, :destroy]

  def index
    @animes = Anime.all.order("created_at DESC");
  end

  def show
  end

  def new
    @anime = current_user.anime.build
  end

  def create
    @anime = current_user.anime.build(anime_params)

    if @anime.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @anime.update(anime_params)
      redirect_to anime_path(@anime)
    else
      render "edit"
    end
  end

  def destroy
    @anime.destroy
    redirect_to root_path
  end

  private
  def anime_params
    params.require(:anime).permit(:title, :description, :creator)
  end

  def find_anime
    @anime = Anime.find(params[:id]);
  end
end

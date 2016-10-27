class AnimesController < ApplicationController

  def index
  end

  def new
    @anime = Anime.new
  end

  def create
    @anime = Anime.new(anime_params)
  end

  private
  def anime_params
    params.require(:anime).permit(:title, :description, :creator)
  end
end

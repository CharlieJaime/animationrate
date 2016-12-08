class AnimesController < ApplicationController
  before_action :find_anime, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    if params[:category].blank?
      @animes = Anime.all.order("created_at DESC");
    else
      @category_id = Category.find_by(name: params[:category]).id
      @animes = Anime.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def show
    if @anime.review.blank?
      @average_review = 0
    else
      @average_review = @anime.review.average(:rating).round(2)
    end
  end

  def new
    @anime = current_user.anime.build
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  def create
    @anime = current_user.anime.build(anime_params)
    @anime.category_id  = params[:category_id]

    if @anime.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  def update
    @anime.category_id  = params[:category_id]

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
    params.require(:anime).permit(:title, :description, :creator, :category_id, :anime_img)
  end

  def find_anime
    @anime = Anime.find(params[:id]);
  end
end

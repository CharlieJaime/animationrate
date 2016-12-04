class ReviewsController < ApplicationController
  before_action :find_anime
  before_action :find_review, only: [:edit, :update, :destroy]

  def new
  end

  def create
    @review = Review.new(review_params)
    @review.anime_id = @anime.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to anime_path(@anime)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to anime_path(@anime)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to anime_path(@anime)
  end

  private

  def find_anime
    @anime = Anime.find(params[:anime_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end

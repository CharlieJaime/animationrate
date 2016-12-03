class ReviewsController < ApplicationController
  before_action :find_anime, only: [:new, :create]

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

  private

  def find_anime
    @anime = Anime.find(params[:anime_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end

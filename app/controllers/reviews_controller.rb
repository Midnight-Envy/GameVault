class ReviewsController < ApplicationController
  before_action :require_login, only: %i[new create]

  def index
    @game = Game.find(params[:game_id])
    @reviews = @game.reviews
  end

  def new
    @game = Game.find(params[:game_id])
    @review = @game.reviews.build
  end

  def create
    @game = Game.find(params[:game_id])
    @review = @game.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to game_reviews_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end
end

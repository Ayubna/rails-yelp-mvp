class ReviewsController < ApplicationController

  def index
    @review = Review.all
  end
  def new
    @reviews = Review.new
  end
  def create
    @review = Review.new(restaurant_params)
    @review.save
      redirect_to review_path(@review)
  end

  def show
    @review = Review.find(params[:id])
  end

end

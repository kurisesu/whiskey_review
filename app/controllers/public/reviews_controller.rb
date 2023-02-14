class Public::ReviewsController < ApplicationController

  def index
    @reviews = Review.page(params[:page])
  end

  def show
    @review = Review.all
    @review = Review.find(params[:id])
    @genre = Genre.find(params[:id])
  end

end




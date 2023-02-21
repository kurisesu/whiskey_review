class Admin::ReviewsController < ApplicationController

  def index
    @reviews = Review.page(params[:page]).per(12)
  end

  def new
    @review = Review.new
    @genres = Genre.all
  end

  def create
    @review = Review.new(review_params)
    if @review.save!
      redirect_to admin_reviews_path
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @reviews = Review.find(params[:id])
    @reviews.destroy
    redirect_to admin_reviews_path
  end


  def edit
    @review = Review.find(params[:id])
    @genres = Genre.all
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
    redirect_to admin_review_path(@review)
    else
    render edit
    end
  end

  private
  def review_params
    params.require(:review).permit(:whiskey_name, :introduction_text, :image, :genre_id)
  end
end




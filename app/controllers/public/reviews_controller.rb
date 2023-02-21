class Public::ReviewsController < ApplicationController

before_action :authenticate_customer!, only: [:show, :create]

  def index
    @reviews = Review.page(params[:page])
    # @review = current_customer.reviews.new
  end

  def show
    @review = Review.all
    @review = Review.find(params[:id])
    #@review = Customer.find(params[:id])
    @genre = Genre.find(params[:id])
    @comments = @review.comments  #投稿詳細に関連付けてあるコメントを全取得
    @comment = current_customer.comments.new
  end

  def create
    @review = current_user.posts.new(post_params)
    if @review.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)  #同上
    end
  end

  private
  def post_params
    params.require(:post).permit(:post_content)
  end


end




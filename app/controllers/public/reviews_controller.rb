class Public::ReviewsController < ApplicationController

before_action :authenticate_customer!, only: [:show, :create]

  def index
    @reviews = Review.page(params[:page])
    @tags = Tag.all

    @reviews = if params[:tag_id].present?
        tag = Tag.find_by(id: params[:tag_id])
        if tag.present?
          tag.reviews
        else
          Review.all
        end
      else
        Review.all
      end
  end
        # if params[:search].present?
    #   reviews = Review.reviews_serach(params[:search])
    # elsif params[:tag_id].present?
    #   @tag = Tag.find(params[:tag_id])
    #   reviews = @tag.items.order(created_at: :desc)
    # else
    #   reviews = Review.all.order(created_at: :desc)
    # end
    # @tag_lists = Tag.all
    # @reviews = Kaminari.paginate_array(reviews).page(params[:page]).per(10)

    # # @review = current_customer.reviews.new


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

    @review = Review.new(review_params)
    tag_list = params[:review][:name].split(nil)
    @review.image.attach(params[:review][:image])
    @review.user_id = current_user.id
    if @review.save
       @review.save_reviews(tag_list)
      redirect_to reviews_path
    else
      flash.now[:alert] = '投稿に失敗しました'
      render 'new'
    end
  end

  def search

  end

  private
  def post_params
    params.require(:post).permit(:post_content)
  end


end




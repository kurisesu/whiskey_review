class Admin::ReviewsController < ApplicationController

  def index
    @reviews = Review.page(params[:page]).per(12)
    @genres = Genre.all
  end

  def new
    @review = Review.new
    @genres = Genre.all
  end

  def create
    @review = Review.new(review_params)
    # if @review.save!
    #   redirect_to admin_reviews_path
    # else
    #   render :new
    # end

    # @review_tag = ReviewTag.new(review_params)
    # @review_tag.admin_id=current_admin.id
    # 受け取った値を,で区切って配列にする
    tag_list=params[:review][:name].split(',')
    if @review.save
      @review.save_tag(tag_list)
      redirect_to admin_reviews_path(@review),notice:'投稿完了しました:)'
    else
      render:new
    end


  end

  def search
    @tag_list = Tag.all  #こっちの投稿一覧表示ページでも全てのタグを表示するために、タグを全取得
    @tag = Tag.find(params[:tag_id])  #クリックしたタグを取得
    @reviews = @tag.posts.all           #クリックしたタグに紐付けられた投稿を全て表示
  end


  def show
    @review = Review.find(params[:id])
    @tag_list = @review.tags.page(params[:page]).per(10)
  end

  def destroy
    @reviews = Review.find(params[:id])
    @reviews.destroy
    redirect_to admin_reviews_path
  end


  def edit
    @review = Review.find(params[:id])
    @genres = Genre.all
    # pluckはmapと同じ意味です！！
    @tag_list=@review.tags.pluck(:name).join(',')
  end

  def update
    @review = Review.find(params[:id])
      tag_list=params[:review][:name].split(',')
    if @review.update(review_params)
       @review.save_tag(tag_list)
       redirect_to admin_review_path(@review.id),notice:'投稿完了しました:)'
    else
      render:edit
    end


  end



  private
  def review_params
    params.require(:review).permit(:whiskey_name, :introduction_text, :image, :genre_id,)
  end
end




class Public::CommentsController < ApplicationController

  def new
    @review = Review.new
    @comment = Comment.new
  end

  def destroy
    comment = Comment.find(params[:id])  # データ（レコード）を1件取得
    comment.destroy  # データ（レコード）を削除
    redirect_to admin_review_path(params[:review_id])  # 投稿一覧画面へリダイレクト
  end

  def create
    @comment = current_customer.comments.new(comment_params)
    @comment.review_id = params[:review_id]
    if @comment.save
      redirect_to admin_review_path(params[:review_id])  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)  #同上
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :star)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end

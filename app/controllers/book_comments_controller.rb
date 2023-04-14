class BookCommentsController < ApplicationController
  def create #コメント作成
    book = Book.find(params[:post_image_id]) #コメントする投稿データを取得

		#comment = PostComment.new(post_comment_params)「:comment機能のみいじれる箱を作る」
    #comment.user_id = current_user.id 「現在ログインしているユーザーidで登録」
    comment = current_user.book_comments.new(book_comment_params)

    comment.book_id = book.id #コメントする投稿画像のidを代入(結びつけ)
    comment.save #保存
    redirect_to book_path(book) #コメントした投稿の詳細画面ヘリダイレクト
  end


	def destroy #コメント削除
    PostComment.find(params[:id]).destroy
    redirect_to book_path(params[:book_id])
  end

  private
  def book_comment_params #:post_commentモデルの:commentカラムのみ取得
    params.require(:book_comment).permit(:comment)
  end

end

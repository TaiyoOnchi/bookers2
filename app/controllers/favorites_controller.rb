class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save #データ保存
    redirect_back(fallback_location: root_path) #前の画面にリダイレクト
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy #データ削除
    redirect_back(fallback_location: root_path) #前の画面にリダイレクト
  end
end

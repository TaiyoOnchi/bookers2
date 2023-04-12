class BooksController < ApplicationController
  def index
    @book=Book.new
    @books=Book.all
    @user = User.find(current_user.id)
  end

  def show
    @newBook=Book.new
    @book = Book.find(params[:id]) 
    @user = User.find(current_user.id)
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "Post was successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = User.find(current_user.id)
      render :index
    end
  end

  def edit
     @book = Book.find(params[:id])
     unless @book.user == current_user
      redirect_to books_path
     end
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    # flash[:success] = "Edit was successfully"
    # redirect_to book_path(book.id)  
    if @book.save
      flash[:success] = "Edit was successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
     book = Book.find(params[:id])  # データ（レコード）を1件取得
	   book.destroy  # データ（レコード）を削除
	   flash[:success] = "Book was successfully Destroyed."
	   redirect_to books_path  # 投稿一覧画面へリダイレクト
  end
  
  private #createアクションの内部でのみ使用可能
	def book_params
	    params.require(:book).permit(:title, :body)# ストロングパラメータ
	end
end



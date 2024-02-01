class BooksController < ApplicationController


  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    puts @books.inspect
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])

  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    flash[:de] = "Book was successfully destroyed."
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:up] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end

  end


    private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

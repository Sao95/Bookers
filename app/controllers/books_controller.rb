class BooksController < ApplicationController

  def top
  end

  def index
    @books = Book.all.order(created_at: :desc) #新しい順の投稿一覧 created_at:作成日時　desc:降順
    @book = Book.new
  end

  def new
  end

  def create
    # データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      # show画面へリダイレクト
      flash[:success] = "successfully created"
      redirect_to book_path(@book.id)

    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:success] = "successfully updated"
      redirect_to book_path(@book.id)

    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:success] = "successfully destroyed"
      redirect_to books_path
    end
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end

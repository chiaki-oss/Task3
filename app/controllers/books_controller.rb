class BooksController < ApplicationController
  def about
  end

  def index
  	@books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
  	if @book.save   #投稿後詳細ページへ
      redirect_to book_path(@book),flash: {complete: "You have created book successfully."}
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book),flash: {success: "Book was successfully updated."}
    else
      render :edit
    end
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end

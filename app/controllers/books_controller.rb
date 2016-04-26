class BooksController < ApplicationController
before_action :fetch_book, only: [:show, :destroy, :edit, :update, :preview]

  def index
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update_attributes(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @book.destroy
    redirect_to root_path, notice: "Book deleted successfully"
  end

  def preview
    @chapters = @book.chapters.includes(:sections)
  end

private
  def book_params
    params.require(:book).permit(:title, :caption)
  end

  def fetch_book
    @book = Book.find(params[:id])
  end
end

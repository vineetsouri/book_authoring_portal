class ChaptersController < ApplicationController
  before_action :fetch_book

  def new
    @chapter = @book.chapters.new
  end

  def create
    @chapter = @book.chapters.new(chapter_params)
    if @chapter.save
      redirect_to book_chapter_path(@book,@chapter)
    else
      render :new
    end
  end

  def show
    @chapter = @book.chapters.find(params[:id])
  end

private

  def fetch_book
    @book = Book.find(params[:book_id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :notes)
  end
end

class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update
    redirect_to @book
  end

  def delete
    @book = Book.find(params[:id])
  end

private
  def book_params
    params.require(:book).permit(:title, :author, :synopsis)
  end
  
end

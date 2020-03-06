class BooksController < ApplicationController
  before_action :current_user, only: [:show, :edit, :udpate, :destroy]
  skip_before_action :authorized, only: [:index]

  def index 
    @books = Book.all
    render :layout => "allbooks"
  end

  def my_books
    @user = current_user
    @books = @user.books
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

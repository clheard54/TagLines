class BooksController < ApplicationController
  before_action :current_user, only: [:edit, :udpate, :destroy]
  skip_before_action :authorized, only: [:index, :new, :create]

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
    redirect_to @book
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
    params.require(:book).permit(:book, :title, :author, :synopsis, :quotes_attributes => [:quote, :notes, :user_id, :book_id])
  end
  
end

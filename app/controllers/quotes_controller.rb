class QuotesController < ApplicationController
    before_action :require_logged_in, only: [:new1, :create1, :newbook, :newmovie, :create2, :edit]

  def index
    @quotes = Quote.all
  end

  def user_quotes
    @quotes = Quote.find_by(user_id: @user.id)
  end

  def new1
    @quote = Quote.new
  end

  def add
    if params[:book?] == 'true'
        @quote = Quote.new
        @book = Book.new
        @book.quotes << @quote
        render 'quotes/newbook'
    else
        @quote = Quote.new
        @movie = Movie.new
        @movie.quotes << @quote
        render 'quotes/newmovie'
    end
  end

#   def newbook
#     @quote = Quote.new
#     @quote.book? == true
#   end

#   def newmovie
#     @quote = Quote.new
#     @quote.book? == false
#   end

  def create2
    @quote = Quote.new
    @quote.tags.build
    @quote = Quote.create(quote_params)
    if @quote.book_id
        @quote.title = Book.find(@quote.book_id).title
    elsif @quote.movie_id
        @quote.title = Movie.find(@quote.movie_id).title
    end
    @quote.user_id = @user.id
    @quote.save
    
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def update
    @quote = Quote.find(params[:id])
    @quote.update
    redirect_to @quote
  end

  def delete
    @quote = Quote.find(params[:id])
  end

private

  def quote_params
    params.require(:quote).permit(:quote, :notes, :movie_id, :book_id, :user_id, :book?, tag_ids: [], tags_attributes => [:name], :books_attributes => [:title, :author, :synopsis], :movies_attributes => [:title, :director, :cast_members])
  end
  
end

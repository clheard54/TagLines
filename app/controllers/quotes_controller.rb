class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def new1
    @quote = Quote.new
  end

  def create1
    if params[:book?] == 'true'
        redirect_to controller: 'quotes', action: 'newbook'
    else
        redirect_to controller: 'quotes', action: 'newmovie'
    end
  end

  def newbook
    @quote = Quote.new
    @quote.book? == true
  end

  def newmovie
    @quote = Quote.new
    @quote.book? == false
  end

  def create2
    byebug
    @quote = Quote.create(quote_params)
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
    params.require(:quote).permit(:quote, :notes, :movie_id, :book_id, :book?, tag_ids: [], tags_attributes => [:name],:books_attributes => [:title, :author, :synopsis], :movies_attributes => [:title, :director, :cast_members])))
  end
  
end

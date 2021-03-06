class QuotesController < ApplicationController
    before_action :authorized, only: [:new1, :add, :create2, :user_quotes, :edit]
  

  def index
    if !params[:search_tag] || params[:search_tag]==''
      @quotes = Quote.all
    else
      @quotes = Quote.filter(params[:search_tag])
    end
    @quotes
    render :layout => "allquotes"
  end

  def user_quotes
    @quotes = Quote.find_by(user_id: current_user.id)
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


  def create2
    @quote = Quote.new
    @quote.user_id = current_user.id
    @quote.notes = params[:quote][:notes]
    if !!params[:quote][:book_id]
      @quote.book_id = params[:quote][:book_id]
    elsif !!params[:quote][:movie_id]
      @quote.movie_id = params[:quote][:movie_id]
    end
    @quote.quote = params[:quote][:quote]
    @quote.save
    Tag.all.each {|tag|
    
      if params[:quote][:quote_tags][:tag_ids].include?(tag.id.to_s)
        @quote.tags << tag
        QuoteTag.create(quote_id: @quote.id, tag_id: tag.id)
      end
    }
    @quote.save
    redirect_to quotes_path
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
    params.require(:quote).permit(:quote, :notes, :movie_id, :book_id, :user_id, :search_tag, :book?, tag_ids: [], :book_attributes => [:title, :author, :synopsis], :movies_attributes => [:title, :director, :cast_members])
  end
  
end

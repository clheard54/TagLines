class UsersController < ApplicationController
    before_action :require_logged_in, only: [:show, :edit, :update, :delete]
#   def index
#     @users = User.all
#   end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save 
        @user = user
        if @user.fave_book
            book_obj = Book.find_or_create_by(title: @user.fave_book)
            @user.fave_book = book_obj
        end
        if @user.fave_movie
            movie_obj = Movie.find_or_create_by(title: @user.fave_movie)
            @user.fave_movie = movie_obj
        end
        session[:user_id] = user.id
        redirect_to user_path(@user)
    else
        flash[:notice] = user.errors.full_messages
        redirect_to(controller: 'users', action: 'new')
    end
  end

  def show
    @user = User.find(params[:id])
    #This is a welcome page
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to @user
  end

  def delete
    @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :email, :password, :fave_book, :fave_movie, :password_confirmation)
  end
end




  
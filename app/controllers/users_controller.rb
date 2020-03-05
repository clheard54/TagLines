class UsersController < ApplicationController
    before_action :authorized, only: [:show, :edit, :update, :delete]

  def user_quotes
    @quotes = @user.quotes
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save 
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

  def my_books
    @user = current_user
    @books = @user.books
  end

  def my_movies
    @user = current_user
    @movies = @user.movies
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
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




  
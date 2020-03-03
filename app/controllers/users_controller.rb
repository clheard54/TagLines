class UsersController < ApplicationController
#   def index
#     @users = User.all
#   end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save 
        redirect_to controller: 'users', action:'show'
    else
        redirect_to controller: 'users', action: 'new'
    end
  end

  def show
    @user = User.find(params[:id])
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
    params.require(:user).permit(:first_name, :last_name, :user_name, :password, :fave_book, :fave_movie, :password_confirmation)
  end
end





class MoviesController < ApplicationController
  before_action :current_user, only: [:new, :edit, :udpate, :destroy]
  skip_before_action :authorized, only: [:index, :create]
  
  def index
    @movies = Movie.all
    render :layout => "allmovies"
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    redirect_to @movie
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to @movie
  end

  def delete
    @movie = Movie.find(params[:id])
  end

private
  def movie_params
    params.require(:movie).permit(:title, :director, :synopsis, :cast_members)
  end
end

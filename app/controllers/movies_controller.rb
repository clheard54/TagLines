class MoviesController < ApplicationController
  before_action :current_user, only: [:show, :edit, :udpate, :destroy]
  
  def index
    @movies = Movie.all
    render :layout => "allmovies"
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update
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

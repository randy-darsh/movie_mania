class MoviesController < ApplicationController
  
  def index
    @director = Director.find(params[:director_id])
    if params[:director_id]
      @movies = Movie.where(director_id: params[:director_id])
    else
      @movies = Movie.all
    end
  end

  def new
    @director = Director.find(params[:director_id])
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    director = Director.find(params[:director_id])
    director.movies.create(movie_params)
    redirect_to director_movies_path
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  def movie_params
    params.require(:movie).permit(:title, :description)
  end
end

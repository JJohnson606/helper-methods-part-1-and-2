class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def index
    #matching_movies = Movie.all

    @movies = Movie.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @movies
      end

      format.html do
      end
    end
  end


  def show
    @movie = Movie.find(params.fetch(:id))
  end

  def create
    movie_attributes = params.require(:movie).permit(:title, :description)
    @movie = Movie.new(movie_attributes)
   

    if @movie.save
      redirect_to movies_url, notice: "Movie created successfully." 
    else
      render "movies/new"  
    end
  end

  def edit
    @movie = Movie.find(params.fetch(:id))
  end

def update
  @movie = Movie.find(params.fetch(:id))
  movie_attributes = params.require(:movie).permit(:title, :description)

  if @movie.update(movie_attributes)
    redirect_to movies_url, notice: "Movie updated successfully."
  else
    redirect_to movies_url, alert: "Movie failed to update successfully."
  end
end

  def destroy
    @movie = Movie.find(params.fetch(:id))
    @movie.destroy

    redirect_to movies_url, notice: "Movie deleted successfully."
  end
end

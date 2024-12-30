class MoviesController < ApplicationController
    before_action :set_movie, only: [:edit, :update]
  
    def index
      @movies = Movie.includes(:client)
    end
  
    def edit
      @clients = Client.where(movie_id: nil) # Clientes que no tienen película asignada
    end
  
    def update
      if @movie.update(movie_params)
        redirect_to movies_path, notice: 'Película actualizada con éxito.'
      else
        render :edit
      end
    end
  
    private
  
    def set_movie
      @movie = Movie.find(params[:id])
    end
  
    def movie_params
      params.require(:movie).permit(:title, :director, :rented, :client_id)
    end
  end
  
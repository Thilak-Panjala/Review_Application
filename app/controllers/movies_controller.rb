class MoviesController < ApplicationController

    before_action :set_movie, only: [:show, :edit, :update, :destroy]
    def show
        render json: @movie
    end


    def index
        @movies = Movie.all
        render json: @movies
    end

    def new
       @movie = Movie.new
    end
    
    def edit
    end

    def create
        if @current_user.admin?
            @movie = Movie.new(movie_params)
            if@movie.save
                render json:@movie, status: :created, location:@movie
            else
                render json:@movie.errors, status: :unprocessable_entity
            end
        else
            render json:"Access Denied!! you can't add movies"
        end
    end

    def update
        if @current_user.admin?
            if@movie.update(movie_params)
                render json:@movie
            else
                render json:@movie.errors, status: :unprocessable_entity
            end
        else
            render json:"Access Denied!! you can't Update movies"
        end
    end

    def destroy
        if @current_user.admin?
            @movie.destroy
            render json: "The movie is deleted"
        else
            render json:"Access Denied!! you can't Delete movies"
        end
    end

    private

    def set_movie
        @movie = Movie.find(params[:id])
    end

    def movie_params
        params.require(:movie).permit(:title,:director,:rating)
    end
end
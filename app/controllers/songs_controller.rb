class SongsController < ApplicationController

    before_action :set_song, only: [:show, :edit, :update, :destroy]
    def show
        render json: @song
    end

    def index
        @songs = Song.where(nil)
        @songs=Song.filter(params[:filter]) if params[:filter].present?
        render json: @songs
    end

    def new
       @song = Song.new
    end
    
    def edit
    end

    def create
        if @current_user.admin?
            @song = Song.new(song_params)
            if@song.save
                render json:@song, status: :created, location:@song
            else
                render json:@song.errors, status: :unprocessable_entity
            end
        else
            render json:"Access Denied!! you can't add songs"
        end
    end

    def update
        if @current_user.admin?
            if @song.update(song_params)
                render json:@song
            else
                render json:@song.errors, status: :unprocessable_entity
            end
        else
            render json:"Access Denied!! you can't Update songs"
        end
    end

    def destroy
        if @current_user.admin?
            @song.destroy
            render json: "The song is deleted"
        else
            render json:"Access Denied!! you can't Delete songs"
        end
    end

    private

    def set_song
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:title,:director,:lyricist,:singer,:rating)
    end
end
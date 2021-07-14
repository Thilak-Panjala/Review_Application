class UsersController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    
    def show
        render json: @user
    end

    def index
        @users = User.all
        render json: @users
    end

    def new
       @user = User.new
    end
    
    def edit
    end

    def create
        @user = User.new(user_params)
        if@user.save
            render json:@user, status: :created, location:@user
        else
            render json:@user.errors, status: :unprocessable_entity
        end
    end

    def update
        if @current_user==@user.id 
            if@user.update(user_params)
                render json:@user
            else
                render json:@user.errors, status: :unprocessable_entity
            end
        else
            render json: "Access denied!! you can't update other User Account Details"
        end
    end

    def destroy
        if @current_user.id==@user.id || @current_user.admin?
            @user.destroy
            render json: "The User is deleted"
        else
            render json: "Access denied!! you can't delete a User Account"
        end
    end

    private

    def set_user
       @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
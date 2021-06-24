class SessionsController < ApplicationController
    skip_before_action :authenticate_request
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.valid_password?(params[:session][:password])
            session[:user_id] = user.id
            render json:{status: "Logged in successfully",
                        user: user.as_json(only: [:id,:email,:authentication_token])} 
        else
            render json:{ status: "Login Failed"}
        end
    end
end
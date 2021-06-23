class ApplicationController < ActionController::API
  before_action :authenticate_request, except: :login
  attr_reader :current_user

  private
  
  def authenticate_request
    @current_user = User.find_by(authentication_token: request.headers["HTTP_AUTHENTICATION_TOKEN"])
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
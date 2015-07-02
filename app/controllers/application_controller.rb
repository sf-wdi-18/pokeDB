class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session
  before_action :verify_token

  def catch_all
    render json: {status: 404}
  end

  private

  def verify_token
    if params[:api_key].nil? || params[:api_key].upcase != Rails.application.secrets.api_key
      render json: {status: 401} #unauthorized
    end  
  end

end

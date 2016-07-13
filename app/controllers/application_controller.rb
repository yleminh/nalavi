class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }
  
  include SessionsHelper
  
  helper_method :current_user
  
  def verify_logged
    if session[:user_id].nil?
      redirect_to dang_nhap_path
    else
      params[:user_id] = session[:user_id]
      @user = User.find(params[:user_id])
    end
  end
  
  def isLogged
    if session[:user_id].nil?
    else
      params[:user_id] = session[:user_id]
    end
  end
  
end

class SessionsController < ApplicationController
  before_filter :isLogged
  layout 'login'
  
  def new
    if params[:user_id]
      redirect_to dashboard_main_path
    end
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
  		flash.now[:error] = "Invalid Email / Password combination."
  		redirect_to root_path
  	else
  		sign_in user
      if is_admin
        redirect_to dashboard_main_path
      else
        redirect_to root_path
      end
  	end
  end

  def destroy
    sign_out
  	redirect_to root_path
  end
end

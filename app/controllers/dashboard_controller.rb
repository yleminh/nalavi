class DashboardController < ApplicationController
  before_filter :verify_logged
  
  def index
    @user = User.find(params[:user_id])
  end

  def show
  end
end

class UsersController < ApplicationController
  before_filter :verify_logged
  
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	
  	byebug
  	
    @user.provider = "Website"
    @user.created_by = "Admin"
    @user.updated_by = "Admin"
    @user.delete_flag = 0

  	if @user.save
  		redirect_to users_path, notice: 'User was save successfull created'
  	else
  		render action: 'new'
  	end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
     
     if @role.update(:updated_at => DateTime.now, :name => role_params[:name], :description => role_params[:description])
         flash[:success] = 'Cập nhật Role Thành Công'
         redirect_to roles_path
     else
       render 'new'
     end
  end
  
  def index
    @users = User.where(delete_flag: 0).all
  end
  
  def show
  	@user = User.find(params[:id])
  end

  private 
  def user_params
      params.require(:user).permit(:name, :email, :password, :provider, :role_id, :delete_flag, :created_by, :updated_by)
  end
end

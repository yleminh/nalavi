class RolesController < ApplicationController
  before_filter :verify_logged
  
  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      redirect_to roles_path, notice: 'Role was save successfull created'
    else
      render 'new'
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
     @role = Role.find(params[:id])
     
     if @role.update(:updated_at => DateTime.now, :name => role_params[:name], :description => role_params[:description])
         flash[:success] = 'Cập nhật Role Thành Công'
         redirect_to roles_path
     else
       render 'new'
     end
  end

  def index
    @roles = Role.all.order('Id ASC')
  end

  def show
  end

  def destroy
  end
  
  private
    def role_params
      params.require(:role).permit(:name, :description)
    end
end

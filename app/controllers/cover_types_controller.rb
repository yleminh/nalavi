class CoverTypesController < ApplicationController
  before_filter :verify_logged
  
  def new
     @cover_type = CoverType.new
  end

  def create
    @user = User.find(params[:user_id])
    @cover_type = CoverType.new(cover_params)
    @cover_type.delete_flag = 0
    @cover_type.created_by = @user.name
    @cover_type.updated_by = @user.name
    
    if @cover_type.save
      redirect_to cover_types_path, notice: 'Cover Type was save successfull created'
    else
      render 'new'
    end
    
  end

  def edit
  end

  def update
  end

  def index
    @ctypes = CoverType.where(delete_flag: 0).all
  end

  def show
  end

  def destroy
  end
  
  private
    def cover_params
      params.require(:cover_type).permit(:name, :description, :delete_flag, :created_by, :updated_by, :slug)
    end
end

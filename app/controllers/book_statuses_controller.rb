class BookStatusesController < ApplicationController
  before_filter :verify_logged
  
  def new
     @book_status = BookStatus.new
  end

  def create
    @user = User.find(params[:user_id])
    @book_status = BookStatus.new(status_params)
    @book_status.delete_flag = 0
    @book_status.created_by = @user.name
    @book_status.updated_by = @user.name
    
    if @book_status.save
      redirect_to book_statuses_path, notice: 'Book Status was save successfull created'
    else
      render 'new'
    end
    
  end

  def edit
  end

  def update
  end

  def index
    @bstatuses = BookStatus.where(delete_flag: 0).all
  end

  def show
  end

  def destroy
  end
  
  private
    def status_params
      params.require(:book_status).permit(:name, :description, :delete_flag, :created_by, :updated_by, :slug)
    end
end

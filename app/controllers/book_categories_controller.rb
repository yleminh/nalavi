class BookCategoriesController < ApplicationController
  before_filter :verify_logged
  
  def new
     @book_cate = BookCategory.new
  end

  def create
    @user = User.find(params[:user_id])
    @book_cate = BookCategory.new(cate_params)
    @book_cate.delete_flag = 0
    @book_cate.created_by = @user.name
    @book_cate.updated_by = @user.name
    
    if @book_cate.save
      redirect_to book_categories_path, notice: 'Book Category was save successfull created'
    else
      render 'new'
    end
    
  end

  def edit
  end

  def update
  end

  def index
    @bcates = BookCategory.where(delete_flag: 0).all
  end

  def show
  end

  def destroy
  end
  
  private
    def cate_params
      params.require(:book_category).permit(:name, :description, :delete_flag, :created_by, :updated_by, :slug)
    end
end

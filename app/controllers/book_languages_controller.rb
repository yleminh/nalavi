class BookLanguagesController < ApplicationController
  before_filter :verify_logged
  
  def new
    @book_language = BookLanguage.new
  end

  def create
    @user = User.find(params[:user_id])
    @book_language = BookLanguage.new(lang_params)
    @book_language.delete_flag = 0
    @book_language.created_by = @user.name
    @book_language.updated_by = @user.name
    
    if @book_language.save
      redirect_to book_languages_path, notice: 'Book Languages was save successfull created'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def index
    @blangs = BookLanguage.where(delete_flag: 0).all
  end

  def show
  end

  def destroy
  end
  
  private
    def lang_params
      params.require(:book_language).permit(:name, :description, :delete_flag, :created_by, :updated_by, :slug)
    end
end

class BooksController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_post,only: [:edit]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have create book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @users = User.all
      @user = current_user
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @users = User.all
    @user = current_user
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def correct_post
        @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end

  private

    def book_params
      params.require(:book).permit(:title, :body)
    end



end

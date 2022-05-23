class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_post,only: [:edit]

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params_update)
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def ensure_correct_post
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to users_path
    end
  end

  private
  def user_params_update
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

end

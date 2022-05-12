class UsersController < ApplicationController
  
  def index
    
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params_update
    params.require(:user).permit(:name, :email, :image, :introduction)
  end
end

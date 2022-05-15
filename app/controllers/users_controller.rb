class UsersController < ApplicationController

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path, success: 'Welcome! You have signed up successfully'
    else
      flash[:danger] = 'ログインに失敗しました'
      render :new
    end
  end


  def index
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
    end
  end

  private
  def user_params_update
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

end

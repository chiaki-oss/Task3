class UsersController < ApplicationController
  before_action :authenticate_user!
  #ログインしてなければ飛ばない

  #Usersページ
  def index
    @users = User.all
    @user = User.new
    @book = Book.new
    @books = Book.all
  end

  #Home画面
  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      redirect_to user_path(@user.id),flash: {success: "You have updated user successfully."}
    else
      render :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!
  #ログインしてなければ飛ばない

  #Usersページ
  def index
    @users = User.all
    @user = User.new
    @book = Book.new    #Users画面での新規投稿フォーム用
    @books = Book.all
  end

  #Home画面
  def show
  	@user = User.find(params[:id]) #db取得:profile
    @users = User.all #profile_img用
    @book = Book.new  #new_book
    @books = Book.all #index/book
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

class UsersController < ApplicationController
  before_action :authenticate_user!
  #ログインしてなければ飛ばない

  #Usersページ
  def index
    @users = User.all
    @user = User.new
  end

  #Home画面
  def show
  	@user = User.find(params[:id])
    @books = @user.books.all
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect to user_path(@user.id)
  end
  private
  def user_params
  	params.require(:user).permit(:name, :profile_image)
  end
end


#マイページ
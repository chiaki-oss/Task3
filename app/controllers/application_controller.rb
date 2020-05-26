class ApplicationController < ActionController::Base
	#ログインしてなければログイン画面へ
	# before_action :authenticate_user!
    #ユーザー登録時にnameのデータ操作を許可
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
	end
end

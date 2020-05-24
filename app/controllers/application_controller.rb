class ApplicationController < ActionController::Base
    #ユーザー登録時にnameのデータ操作を許可
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end
end

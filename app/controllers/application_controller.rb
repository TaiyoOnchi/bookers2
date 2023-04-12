class ApplicationController < ActionController::Base
	before_action :authenticate_user!, except: [:top,:about] 
  #devise利用の機能(ユーザ登録、ログイン認証など)が使われる前にconfigure_permitted_parametersメソッドが実行される
  before_action :configure_permitted_parameters,if: :devise_controller?
  

	def after_sign_in_path_for(resource)#サインイン後にどこに遷移するかを設定しているメソッド
	  flash[:success] = "successfully"
	  user_path(current_user.id)
	end

	def after_sign_out_path_for(resource)#サインアウト後にどこに遷移するかを設定しているメソッド
	  flash[:success] = "successfully"
	  root_path
	end

	protected #呼び出された他のコントローラからも参照することができる
	def configure_permitted_parameters
			#ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
	    # devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
	end
end

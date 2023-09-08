class ApplicationController < ActionController::Base
<<<<<<< Updated upstream
  before_action :basic_auth
  before_action :configure_permitted_parameters, only: [:create], if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_TEAM"] && password == ENV["BASIC_AUTH_PASS"]  
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  end
=======
  before_action :basic_path

  private
  def basic_path
    authenticate_or_request_with_http_basic do |username, password|
      teamname == ENV["BASIC_AUTH_TEAM"] && password == ENV["BASIC_AUTH_PASS"]  # 環境変数を読み込む記述に変更
    end
  end  
>>>>>>> Stashed changes
end

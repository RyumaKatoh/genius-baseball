class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, only: [:create], if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # username == "ybcbaseball" && password == "kashiwa2005"
      username == ENV["BASIC_AUTH_TEAM"] && password == ENV["BASIC_AUTH_PASS"]  
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :password_confirmation, :last_name_kanji, :first_name_kanji, :last_name_kana, :first_name_kana, :birthday])
  end
end

class ApplicationController < ActionController::Base
  before_action :basic_auth


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # username == "ybcbaseball" && password == "kashiwa2005"
      username == ENV["BASIC_AUTH_TEAM"] && password == ENV["BASIC_AUTH_PASS"]  
    end
  end
end

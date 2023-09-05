class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id]) 
    @practices = @user.practices.order(created_at: :desc).page(params[:page]).per(5)

    favorites = Favorite.where(user_id: @user.id).pluck(:practice_id)
    @favorite_list = Practice.find(favorites)

    @active_tab = params[:tab] || 'practice' # デフォルトは投稿一覧タブ
  end
end

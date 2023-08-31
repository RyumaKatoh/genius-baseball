class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 
    @practices = @user.practices

    favorites = Favorite.where(user_id: @user.id).pluck(:practice_id)
    @favorite_list = Practice.find(favorites)

    @active_tab = params[:tab] || 'practice' # デフォルトは投稿一覧タブ
  end
end

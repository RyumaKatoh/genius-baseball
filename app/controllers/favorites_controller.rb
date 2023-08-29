class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(practice_id: params[:practice_id])
    favorite.save
    redirect_to root_path
  end

  def destroy
    favorite = Favorite.find_by(practice_id: params[:practice_id], user_id: current_user.id)
    favorite.destroy
    redirect_to root_path
  end
end

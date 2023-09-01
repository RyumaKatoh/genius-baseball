class FavoritesController < ApplicationController
  before_action :set_practice, only: [ :create, :destroy] 

  def create
    if user_signed_in?
      favorite = current_user.favorites.build(practice_id: params[:practice_id])
      favorite.save
      render partial: "favorites/favorite", locals: { practice: @practice }
      # respond_to do |format| 
      #   format.js
      # end
    else
      redirect_to new_user_session_path
    end    
  end

  def destroy
    if user_signed_in?
      favorite = Favorite.find_by(practice_id: params[:practice_id], user_id: current_user.id)
      favorite.destroy
      render partial: "favorites/favorite", locals: { practice: @practice }
      # respond_to do |format|
      #   format.js
      # end
    else
      redirect_to new_user_session_path
    end  
  end

  def set_practice
    @practice = Practice.find(params[:practice_id])
  end
end

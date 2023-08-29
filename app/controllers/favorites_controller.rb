class FavoritesController < ApplicationController
  before_action :set_practice

  def create
    favorite = current_user.favorites.build(practice_id: params[:practice_id])
    favorite.save
    render partial: "favorites/favorite", locals: { practice: @practice }
    # respond_to do |format|
    #   format.js
    # end
  end

  def destroy
    favorite = Favorite.find_by(practice_id: params[:practice_id], user_id: current_user.id)
    favorite.destroy
    render partial: "favorites/favorite", locals: { practice: @practice }
    # respond_to do |format|
    #   format.js
    # end
  end

  def set_practice
    @practice = Practice.find(params[:practice_id])
  end
end

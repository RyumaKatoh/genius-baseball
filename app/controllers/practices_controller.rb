class PracticesController < ApplicationController

  def index
    @practices = Practice.includes(:user).order(created_at: :desc) 
  end  

  def new
    @practice = Practice.new
  end  

  def create
    @practice = Practice.new(practice_params)
    if @practice.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  def practice_params
    params.require(:practice).permit(:player_id, :attempt_id, :video, :point).merge(user_id: current_user.id)
  end
end

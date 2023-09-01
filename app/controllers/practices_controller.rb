class PracticesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_practice, only: [:show, :edit, :update, :destroy ]


  def search
    @q = Practice.ransack(params[:q])
    @practices = @q.result.order(created_at: :desc).page(params[:page]).per(5)
  end

  def index
    @q = Practice.ransack(params[:q])
    @practices = @q.result.order(created_at: :desc).page(params[:page]).per(5)
    # @practices = Practice.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
    # @q = Practice.ransack(params[:q]) 
    # @practices1 = @q.result
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

  def show
    @comment = Comment.new
    @comments = @practice.comments.includes(:user)
  end  

  def edit
    @practice = Practice.find(params[:id])
    if !user_signed_in?
      redirect_to new_user_session_path 
    elsif current_user != @practice.user
      redirect_to root_path
    end
  end 
  
  def update
    @practice = Practice.find(params[:id])
    if @practice.update(practice_params)
      redirect_to practice_path(@practice.id)
    else
      render :edit, status: :unprocessable_entity  
    end   
  end  

  def destroy
    if user_signed_in? && @practice.user == current_user
      @practice.destroy
      redirect_to root_path
    else
      redirect_to practice_path(@practice.id) 
    end   
  end  
  
  private
  def practice_params
    params.require(:practice).permit(:player_id, :attempt_id, :point, {videos:[] }).merge(user_id: current_user.id)
  end

  def set_practice
    @practice = Practice.find(params[:id])
  end  
end

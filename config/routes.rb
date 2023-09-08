Rails.application.routes.draw do
<<<<<<< Updated upstream
  devise_for :users
  root to: "practices#index"
#   # マイページのルーティングにネスト
  resources :users, only: [:show] do
    get :favorites, on: :collection
  end

# # 練習投稿表示のルーティングにネスト
  resources :practices do
    collection do
      get 'search'
    end  
     resources :comments , only: [:create, :destroy] 
     resource :favorites, only: [:create, :destroy]
=======
  # マイページのルーティングにネスト
  resources :users, only: [:show, :edit, :update] do
    get :favorites, on: :collection
  end

# 練習投稿のルーティングにネスト
  resources :practices do
    resources :comments do
    resource :favorites, only: [:create, :destroy]
>>>>>>> Stashed changes
  end
end

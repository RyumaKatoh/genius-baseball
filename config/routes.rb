Rails.application.routes.draw do
  devise_for :users
  root to: "practices#index"
#   # マイページのルーティングにネスト
#   resources :users, only: [:show, :edit, :update] do
#     get :favorites, on: :collection
#   end

# # 練習投稿表示のルーティングにネスト
  resources :practices do
     resources :comments , only: [:create, :destroy] 
     resource :favorites, only: [:create, :destroy]
  end
end

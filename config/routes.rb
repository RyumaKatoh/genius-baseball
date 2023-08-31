Rails.application.routes.draw do
  devise_for :users
  root to: "practices#search"
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
  end
end

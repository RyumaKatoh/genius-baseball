Rails.application.routes.draw do
  root to: "practices#index"
#   # マイページのルーティングにネスト
#   resources :users, only: [:show, :edit, :update] do
#     get :favorites, on: :collection
#   end

# # 練習投稿表示のルーティングにネスト
#   resources :practices do
# #     resources :comments do
# #     resource :favorites, only: [:create, :destroy]
#   end
end

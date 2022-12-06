Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins

  # root to: "public/homes#top"

  # 会員側のルーティング設定
  resources :items

  # 管理者側のルーティング設定
  namespace :admin do
    resources :items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

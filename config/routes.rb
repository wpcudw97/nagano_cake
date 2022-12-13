Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins

  # 会員側のルーティング設定
  root to: "public/homes#top"
    # resources :items, only:[:new]

  # 管理者側のルーティング設定
  namespace :admin do
    root to: "homes#top"
    get "home/about" => "homes#about", as: "about"
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

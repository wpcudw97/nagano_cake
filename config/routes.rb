Rails.application.routes.draw do
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  end
  namespace :public do
    get 'customer/show'
    get 'customer/edit'
    get 'customer/update'
    get 'customer/unsubscribe'
    get 'customer/withdraw'
  end
  devise_for :customers,controllers: {
    sessions: "public/sessions",
    passwords: "public/passwords",
    registrations: "public/registrations"
  }
  devise_for :admins,controllers: {
    sessions: "admin/sessions",
    passwords: "admin/passwords",
    registrations: "admin/registrations"
  }

  # 会員側のルーティング設定
  root to: "public/homes#top"
  get "about" => "public/homes#about", as: "about"
  get "customers/my_page" => "public/customers#show", as: "customer"
  get "customers/information/edit" => "public/customers#edit", as: "edit_customer"
  patch "customers/information" => "public/customers#update"
  get "customers/unsubscribe" => "public/customers#unsubscribe", as: "unsubscribe_customer"
  get "customers/withdraw" => "public/customers#withdraw", as: "withdraw_customer"
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

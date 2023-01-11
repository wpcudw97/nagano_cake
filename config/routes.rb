Rails.application.routes.draw do

  devise_for :customers,controllers: {
    sessions: "public/sessions",
    passwords: "public/passwords",
    registrations: "public/registrations"
  }
  devise_for :admin,controllers: {
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
  patch "customers/withdraw" => "public/customers#withdraw"
  scope module: :public do
    resources :items, only:[:index, :show, :update]
    resources :cart_items, only:[:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :addresses, only:[:index, :edit, :create, :update ,:destroy]
    resources :orders, only:[:new, :create, :index, :show] do
      collection do
         post "confirm"
         get "complete"
      end
    end
  end


  # 管理者側のルーティング設定
  namespace :admin do
    root to: "homes#top"
    resources :items, only:[:index, :new, :create, :show, :edit, :update, :destroy]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

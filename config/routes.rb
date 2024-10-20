Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root :to => "homes#top"
    get "about" => "homes#about"
    get 'orders/confirm'
    get 'orders/thanks'
    resources :orders, only: [:create, :index, :new, :show]
    get 'genres', to: 'admin/genres#index', as: :genres
    get 'genres/:id', to: 'admin/genres#show', as: :genre
    get 'customers/my_page', to: 'customers#show'
    get 'customers/information/edit', to: 'customers#edit'
    patch 'customers/information', to: 'customers#update'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
    get 'homes/about'
    resources :addresses, only: [:new, :index, :edit, :create, :update, :destroy]
    resources :genres
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete :destroy_all # カートを空にするルート
      end
    end
  end

  namespace :admin do
    root :to => 'homes#top'
    get 'order_details/update'
    get 'orders/show'
    get 'orders/update'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders
 end
end
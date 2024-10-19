Rails.application.routes.draw do

  scope module: :public do
    resources :orders
    get 'orders/confirm'
    get 'orders/thanks'
  end

  namespace :admin do
    get 'order_details/update'
    get 'orders/show'
    get 'orders/update'
    get 'homes/top'
    get 'homes/about'
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
    resources :genres
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
     get '/' => 'homes#top'
     root :to =>"admin/homes#top"

  end

  namespace :public do
    get 'genres', to: 'admin/genres#index', as: :genres
    get 'genres/:id', to: 'admin/genres#show', as: :genre
    # get 'addresses/index'
    # get 'addresses/edit'
    # get 'addresses/create'
    # get 'addresses/update'
    # get 'addresses/destroy'
    resources :addresses, only: [:new, :index, :edit, :create, :update, :destroy]
  end

  namespace :public do
    # get 'orders/new'
    # get 'orders/confirm'
    # get 'orders/thanks'
    # get 'orders/create'
    # get 'orders/index'
    # get 'orders/show'
    # resources :orders
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'
    get 'addresses/index'
    get 'addresses/edit'
    get 'addresses/create'
    get 'addresses/update'
    get 'addresses/destroy'
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/thanks'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  end

  get 'homes/top'
  get 'homes/about'

  root :to =>"public/homes#top"
  get "home/about"=>"public/homes#about"
  # get "items/:id"=>"public/items#show"

# 顧客用
# URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
end
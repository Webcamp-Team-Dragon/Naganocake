Rails.application.routes.draw do
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
    
     get '/' => 'homes#top'
     root :to =>"admin/homes#top"
     
  end

  namespace :public do
    get 'genres', to: 'admin/genres#index', as: :genres
    get 'genres/:id', to: 'admin/genres#show', as: :genre

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
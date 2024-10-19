Rails.application.routes.draw do

  scope module: :public do
    resources :orders
    get 'orders/confirm'
    get 'orders/thanks'
  end

  scope module: :public do
    resources :customers, only: [:show, :edit, :update]
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

   resources :items, only: [:show, :index, :new, :create, :edit, :update]
    
     get '/' => 'homes#top'
     root :to =>"admin/homes#top"

  end

  namespace :public do
    get 'genres', to: 'admin/genres#index', as: :genres
    get 'genres/:id', to: 'admin/genres#show', as: :genre

    resources :addresses, only: [:new, :index, :edit, :create, :update, :destroy]

    get 'addresses/index'
    get 'addresses/edit'
    get 'addresses/create'
    get 'addresses/update'
    get 'addresses/destroy'

    get 'customers/unsubscribe'
    get 'customers/withdraw'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
 
  get 'homes/top'
  get 'homes/about'

  root :to =>"public/homes#top"
  get "home/about"=>"public/homes#about"
  # get "items/:id"=>"public/items#show"
 end
    
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
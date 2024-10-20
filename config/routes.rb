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
    root :to =>"homes#top"
    get 'homes/about'
    get 'orders/confirm'
    get 'orders/thanks'
    get 'genres', to: 'admin/genres#index', as: :genres
    get 'genres/:id', to: 'admin/genres#show', as: :genre
    get 'customers/unsubscribe'
    get 'customers/withdraw'
    resources :orders, only: [:create, :index, :new, :show]
    resources :addresses, only: [:new, :index, :edit, :create, :update, :destroy]
    resources :customers, only: [:show, :edit, :update]
    resources :genres
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete :destroy_all # カートを空にするルート
      end
    end
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
 end
end
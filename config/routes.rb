Rails.application.routes.draw do
  # 顧客用
<<<<<<< HEAD
  # URL /customers/sign_in ...
=======
# URL /customers/sign_in ...
>>>>>>> develop
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
<<<<<<< HEAD
  root :to =>"public/homes#top"
=======


  root :to =>"public/homes#top"
  get "home/about"=>"public/homes#about"
>>>>>>> develop

  scope module: :public do
    resources :orders, only: [:confirm, :create, :index, :new, :show, :thanks]
    get 'orders/confirm'
    get 'orders/thanks'
  end

  scope module: :public do
    resources :customers, only: [:show, :edit, :update]
    resources :items, only: [:index, :show]
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

    get 'customers/unsubscribe'
    get 'customers/withdraw'


  get 'homes/top'
  get 'homes/about'

  # get "items/:id"=>"public/items#show"

 end


end
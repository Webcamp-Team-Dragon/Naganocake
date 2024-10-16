Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/about'
  
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  
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
end

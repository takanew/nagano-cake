Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # admin/homesコントローラー　top
  get '/admin', to: 'admin/homes#top'
  
  # public/homesコントローラー　top
  get '/' => 'public/homes#top'
  
  # public/customersコントローラー　show 会員マイページ
  get '/customers/my_page/', to: 'public/customers#show'
   # public/customersコントローラー　edit 会員マイページ
  get '/customers/edit_information', to: 'public/customers#edit' 
  
  # public/ordersコントローラー　index 注文履歴
  get '/orders', to: 'public/orders#index' 
  
end


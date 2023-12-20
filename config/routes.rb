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


  # public/homesコントローラーの記述
  # public/homesコントローラー　top
  get '/' => 'public/homes#top'
  # public/homesコントローラー　about
  get '/about' =>  'public/homes#about'


  # public/customersコントローラーの記述
  # public/customersコントローラー　show 会員マイページ
  get '/customers/my_page/', to: 'public/customers#show'
   # public/customersコントローラー　edit 会員情報編集ページ
  get '/customers/edit_information', to: 'public/customers#edit'
  # public/customersコントローラー　update
  patch '/customers/update_information', to: 'public/customers#update'
  # public/customersコントローラー　confirm 顧客の退会確認画面
  get '/customers/confirm', to: 'public/customers#confirm'
  # public/customersコントローラー　withdraw　顧客の退会処理（ステータス更新）
  patch '/customers/withdraw', to: 'public/customers#withdraw'


  # public/ordersコントローラーの記述
  # public/ordersコントローラー　index 注文履歴
  get '/orders', to: 'public/orders#index'


  # admin/homesコントローラーの記述
  # admin/homesコントローラー　top
  get '/admin', to: 'admin/homes#top'

  
  # admin/itemsコントローラーの記述
  # admin/itemsコントローラー　index
  # get '/admins/index', to: 'admin/items#index'
  # admin/itemsコントローラー　new
  # get '/admin/items/new', to: 'admin/items#new'
  # admin/itemsコントローラー　create
  # post '/admin/items', to: 'admin/items#create'
  # admin/itemsコントローラー　show
  # get '/admin/items/:id', to: 'admin/items#show'
  # get '/admin/items/:id', to: 'admin/items#show'
  # admin/itemsコントローラー　edit
  #get '/admin/items/:id/edit', to: 'admin/items#edit'
  # admin/itemsコントローラー　up
  
   namespace :admin do
     resources :items,only: [:index, :new, :create, :show, :edit, :update]
   end
  
  
end


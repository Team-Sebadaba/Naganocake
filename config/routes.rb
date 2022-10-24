Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # public(会員側)
  # homes
  root :to => "public/homes#top"
  get '/about' => 'public/homes#about'

  # customers
  get '/customers' => 'public/customers#show'
  get '/customers/infomation/edit' => 'public/customers#edit', as: 'edit_customer'
  patch '/customers/infomation' => 'public/customers#update'
  get '/customers/confirm' => 'public/customers#confirm'
  patch 'customers/:id/withdraw' => 'public/customers#withdraw', as: 'withdraw_customer'

  # destinations
  get '/destinations' => 'public/destinations#index'
  post '/destinations' => 'public/destinations#create'
  patch 'destinations/:id' => 'public/destinations#update', as: 'update_destination'
  get '/destinations/:id/edit' => 'public/destinations#edit', as: 'edit_destination'
  delete '/destinations/:id' => 'public/destinations#destroy', as: 'destroy_destination'

  # orders
  get '/orders/new' => 'public/orders#new'
  get '/orders' => 'public/orders#index'
  get '/orders/:id' => 'public/orders#show'
  post '/orders/create' => 'public/orders#create'
  post '/orders/confirm' => 'public/orders#confirm'
  get '/orders/complete' => 'public/orders#complete'

  # items
  get '/items' => 'public/items#index'
  get '/items/:id' => 'public/items#show', as: 'show_items'

  # cart_items
  scope module: :public do
  resources :cart_items, only: [:index, :update, :destroy, :create]
  end
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'


  # admin(管理者側)
  namespace :admin do
    root :to => 'homes#top'
    resources :homes, only: [:top]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update] do
    resources :order_details, only: [:update]
    end
  end

end

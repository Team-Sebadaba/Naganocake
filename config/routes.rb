Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  root :to => "public/homes#top"


  get '/about' => 'public/homes#about'

  # get '/admin' => 'homes#top'

  get "/customers" => "public/customers#show"
  get "/customers/infomation/edit" => "public/customers#edit"
  patch "/customers/infomation" => "public/customers#update"
  get "/customers/confirm" => "public/customers#confirm"
  patch "customers/withdraw" => "public/customers#withdraw"

  # resources :items, only: [:index, :show]
  get "/items" => "public/items#index"
  get "/items/:id" => "public/items#show"
  # resources :registrations, only: [:new, :create]

  # resources :sessions, only: [:new, :create, :destroy]
  # resources :customers, only: [:show, :edit, :update, :confirm, :withdraw]
  resources :cart_items, only: [:index, :update, :destroy, :create]
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
  resources :destinations, only: [:index, :edit, :create, :update, :destroy]

  namespace :admin do
    root :to => 'homes#top'
    # resources :sessions, only: [:new, :create, :destroy]
    resources :homes, only: [:top]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

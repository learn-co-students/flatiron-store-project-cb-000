Rails.application.routes.draw do
  root 'application#redirecrt_to_store'
  post '/checkout', to: 'carts#checkout'
  get '/store', to: 'store#index'
  resources :carts
  resources :items
  resources :categories
  devise_for :users
  resources :line_items, only: [:create]
  #get '/users/sign_out', to: 'store#index'
end

Rails.application.routes.draw do


  devise_for :users
  root 'store#index', as: 'store'

  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :users, only: [:show]
  resources :carts
#  resources :line_items, only: [:create]
  resources :orders, only: [:show]

  post 'line_items/:id', to: 'line_items#create', as: 'line_items'
  post 'carts/:id', to: 'carts#checkout', as: 'checkout'

end

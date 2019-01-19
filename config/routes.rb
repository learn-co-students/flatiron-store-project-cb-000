Rails.application.routes.draw do

  devise_for :users
  root 'store#index', as: 'store'

  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :users, only: [:new, :create, :show]
  resources :carts
  resources :line_items, only: [:create]
  resources :orders, only: [:show]
  resources :sessions, only: [:create]

  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'
  get '/signin', to: 'sessions#new'
  delete '/sessions', to: 'sessions#destroy'

end

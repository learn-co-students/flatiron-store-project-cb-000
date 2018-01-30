Rails.application.routes.draw do

  devise_for :users, :controllers => {:sessions => "users/sessions", :registrations => "users/registrations"}
  root 'store#index', as: 'store'

  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :users, only: [:show]
  resources :carts
  resources :line_items, only: [:create, :destroy]
  resources :orders, only: [:show, :create]

  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

end

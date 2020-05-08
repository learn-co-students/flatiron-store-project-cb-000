Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'store#index', as: :store
  resources :categories
  resources :line_items
  resources :items
  resources :carts
  post '/checkout', to: 'carts#checkout'
end

Rails.application.routes.draw do
  get 'cards/new'
  devise_for :users
  root to: "items#index"
  resources :items
  resources :items do
  resources :orders, only: :create
  end
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :update]
  resources :cards, only: [:new, :create]
  resources :orders, only: [:index]
  get '/orders/:id', to: 'orders#index', as: 'order'
end

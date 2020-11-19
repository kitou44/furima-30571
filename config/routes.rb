Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :destroy, :edit, :update]
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :update]
  
  resources :orders, only: [:index]
  get '/orders/:id', to: 'orders#index', as: 'order'
end

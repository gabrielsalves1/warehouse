Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :warehouses, only: [:show, :new, :create]
  resources :suppliers, only: [:index, :show, :new, :create]
  resources :product_models, only: [:new, :create]
end

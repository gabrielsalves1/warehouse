Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  resources :warehouses, only: [:show, :new, :create, :edit, :update]
  resources :suppliers, only: [:index, :show, :new, :create]
  resources :product_models, only: [:new, :create, :show]
  resources :product_bundles, only: [:new, :create, :show]
end

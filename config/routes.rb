Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  resources :product_model_items, only: [:new]
  resources :warehouses, only: [:show, :new, :create, :edit, :update]
  resources :suppliers, only: [:index, :show, :new, :create]
  resources :product_models, only: [:new, :create, :show, :edit, :update]
  resources :categories, only: [:index, :new, :create, :show]
  resources :product_bundles, only: [:new, :create, :show]
end

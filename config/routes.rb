Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  get 'search', to:"home#search"
  resources :warehouses, only: [:show, :new, :create, :edit, :update]
  resources :suppliers, only: [:index, :show, :new, :create]
  resources :product_models, only: [:new, :create, :show, :edit, :update]
  resources :categories, only: [:index, :new, :create, :show]
  resources :product_bundles, only: [:new, :create, :show]
  get 'product_items/entry', to: 'product_items#new_entry'
  post 'product_items/entry', to: 'product_items#process_entry'

  namespace :api, defaults: { format: :json }  do
    namespace :v1 do
      resources :warehouses, only: [:index, :show]
      resources :suppliers, only: [:index, :show]
      resources :product_models, only: [:index, :show]
    end
  end
end

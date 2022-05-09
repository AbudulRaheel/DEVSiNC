# frozen_string_literal: true

# rails routes
Rails.application.routes.draw do
  resources :orders, only: %i[index] do
    get 'create'
    get 'detail'
  end

  resources :products do
    resources :comments, shallow: true
    collection do
      get 'myproducts'
      get 'search'
    end
  end
  resources :logout_carts
  resources :carts, only: %i[index update]
  resources :cart_products, only: %i[create destroy edit update]

  resources :checkout, only: %i[create]

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]
  post 'coupon', to: 'carts#coupon'
  get 'complete', to: 'orders#complete'
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

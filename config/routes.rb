# frozen_string_literal: true

# rails routes
Rails.application.routes.draw do
  get 'logout_carts/index'
  get 'cart/cart'
  get 'comments/comments'
  get 'orders/create'
  get 'complete', to: 'orders#complete'
  get 'detail', to: 'orders#detail'
  get 'search', to: 'products#search'
  post 'coupon', to: 'carts#coupon'
  get 'myproducts', to: 'products#myproducts'

  resources :orders, only: %i[index]
  resources :products do
    resources :comments, shallow: true
  end

  resources :carts, only: %i[index update]
  resources :cart_products, only: %i[create destroy edit update]
  resources :logout_carts
  resources :checkout, only: %i[create]

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]

  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

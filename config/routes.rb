Rails.application.routes.draw do
  get 'cart/cart'
  get 'comments/comments'
  get 'search', to: 'products#search'
  post 'coupon', to: 'carts#coupon'
  resources :products do
    resources :comments, shallow: true
  end
  resources :carts, only: %i[index update]
  resources :cart_products, only: %i[create destroy edit update]

  get 'myproducts', to: 'products#myproducts'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]

  # resources :comments
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

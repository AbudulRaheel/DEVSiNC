Rails.application.routes.draw do
  get 'comments/comments'
  resources :products do
    resources :comments, shallow: true
  end

  # get 'home', to: 'homepage#homepage'
  # get 'welcomepage/index'
  get 'myproducts', to: 'products#myproducts'
  # get 'viewproducts', to: 'products#viewproducts'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]

  # resources :comments
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

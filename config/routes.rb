Rails.application.routes.draw do
  resources :products
  get 'homepage/homepage'
  get 'welcomepage/index'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'welcomepage#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

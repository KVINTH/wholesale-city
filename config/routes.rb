Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  get 'users/new'

  get 'users/create'

  get 'users/allowed_params'

  get 'users_controller/new'

  get 'users_controller/create'

  get 'users_controller/allowed_params'

  get 'carts/show'
  get 'cart/checkout', to: 'carts#checkout' 
  get 'cart_items/create'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # resources for shopping cart
  resources :products, only: [:all]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  # resources for stripe checkout
  resources :charges, only: [:new, :create]

  # resources for login
  resources :users
  resources :sessions

  # Page Routes   
  root to: 'products#all'

  # get 'pages/home'
  # get 'pages/products', as: 'products'
  # get 'pages/about', as: 'about'
  # get 'pages/contact', as: 'contact'
  get 'pages/:string', to: 'pages#show', as: 'page'

  # Product Routes
  get 'products/', to: 'products#all', as: 'products'
  get 'products/all', to: 'products#all'
  get 'products/show/:number', to: 'products#show', as: 'product'
  get 'products/categories/:string', to: 'products#category', as: 'category'
  get 'products/new', to: 'products#new', as: 'new_products'
  get 'products/updated', to: 'products#updated', as: 'updated_products'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

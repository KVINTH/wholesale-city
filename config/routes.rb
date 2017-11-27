Rails.application.routes.draw do
  
  get 'carts/show'
  get 'cart_items/create'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # resources for shopping cart
  resources :products, only: [:all]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  # resources for stripe checkout
  resources :charges, only: [:new, :create]

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

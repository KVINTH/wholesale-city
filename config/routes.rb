Rails.application.routes.draw do

  get 'cart_items/create'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Page Routes
  root 'pages#home', as: 'home'
  get 'pages/home'
  # get 'pages/products', as: 'products'
  # get 'pages/about', as: 'about'
  # get 'pages/contact', as: 'contact'
  get 'pages/:string', to: 'pages#show', as: 'page'

  # Product Routes
  get 'products/', to: 'products#all', as: 'products'
  get 'products/all', to: 'products#all'
  get 'products/:number', to: 'products#show', as: 'product'
  get 'products/categories/:string', to: 'products#category', as: 'category'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

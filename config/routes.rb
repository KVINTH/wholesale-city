Rails.application.routes.draw do
  get 'pages/home'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'pages#home', as: 'home'
  get 'pages/home'
  get 'pages/products', as: 'products'
  get 'pages/about', as: 'about'
  get 'pages/contac', as: 'contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

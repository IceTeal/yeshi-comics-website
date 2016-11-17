Rails.application.routes.draw do

  root to: 'products#index'
  get 'about_us' => 'pages#about_us', as: 'about_us'
  get 'contact' => 'pages#contact', as: 'contact'

  get 'products' => 'products#index', as: 'products'
  get 'products/:id' => 'products#show', as: 'product', id: /\d+/

  get 'search' => 'products#search', as: 'search'
  get 'search_results' => 'products#search_results', as: 'search_results'

  #get 'about_us' => 'page#about_us', as 'about_us'
  #get 'contact' => 'pages#contact', as 'contact'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

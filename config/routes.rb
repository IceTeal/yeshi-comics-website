Rails.application.routes.draw do

  get 'products' => 'products#index', as: 'products'
  get 'products/:id' => 'products#show', as: 'product', id: /\d+/

  get 'search' => 'products#search', as: 'search'
  get 'search_results' => 'products#search_results', as: 'search_results'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

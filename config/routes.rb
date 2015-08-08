Rails.application.routes.draw do

  root to: 'recipes#index'

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :recipes

  namespace :admin do
    resources :users
    resources :ingredients, only: [:new, :create, :edit, :update, :destroy, :index]
    resources :measurements, only: [:new, :create, :edit, :update, :destroy, :index]
  end
  
end

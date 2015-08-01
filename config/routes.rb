Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :edit]
  resources :recipes

  namespace :admin do
    resources :users
    resources :ingredients, only: [:new, :create, :edit, :update, :destroy]
  end
  
end

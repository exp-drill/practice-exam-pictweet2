Rails.application.routes.draw do
  root  'tweets#index'
  
  resources :tweets do
    resources :comments, only: :create
  end

  namespace :tweets do
    resources :searches, only: :index
  end

  resources :users, only: :show
  devise_for :users
end
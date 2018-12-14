Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :friendship_requests, only: [:create]
  root 'users#index'
end

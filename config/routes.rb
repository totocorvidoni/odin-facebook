Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users,               only: [:index, :show]
  resources :friendship_requests, only: [:create]
  resources :friendships,         only: [:create, :destroy]
end

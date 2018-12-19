Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :posts
  resources :users,               only: [:index, :show]
  resources :friendship_requests, only: [:create]
  resources :friendships,         only: [:create, :destroy]
  resources :likes,               only: [:create, :destroy]
end

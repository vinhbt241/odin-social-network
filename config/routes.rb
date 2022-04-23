Rails.application.routes.draw do
  root "posts#index"
  
  devise_for :users

  resources :posts
  resources :friend_requests, only: [:index, :create]
  resources :friendships, only: [:create]
end

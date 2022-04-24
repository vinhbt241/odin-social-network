Rails.application.routes.draw do
  root "posts#index"
  
  devise_for :users

  resources :posts
  resources :friend_requests, only: [:index, :create]
  resources :friendships, only: [:create]
  resources :comments, only: [:create]
  resources :likes, only: [:create]
  post '/like/downvote', to: 'likes#destroy', as:'downvote'
end

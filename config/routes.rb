Rails.application.routes.draw do
  root "posts#index"
  
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :posts
  resources :friend_requests, only: [:index, :create]
  resources :friendships, only: [:create]
  resources :comments, only: [:create]
  post '/like/update-like', to: 'likes#update_like', as:'update_like'
  resources :users, only: [:show]
  resources :profiles, only: [:new, :create, :edit, :update]
end

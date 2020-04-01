Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :users, only: [:show]
  resources :posts, only: [:index, :show, :new, :create, :destroy] do 
    resources :comments, only: [:new, :create]
    resources :likes, only: [:new, :create]
  end
  resources :comments, only: [:destroy]
  resources :likes, only: [:destroy]
end

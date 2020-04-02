Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :users, only: [:show] do 
    resources :follows, only: [:new, :create]
  end
  resources :posts, only: [:index, :show, :new, :create, :destroy] do 
    resources :comments, only: [:new, :create]
    resources :likes, only: [:new, :create]
  end
  resources :comments, only: [:destroy]
  resources :likes, only: [:destroy]
  resources :follows, only: [:destroy]
end

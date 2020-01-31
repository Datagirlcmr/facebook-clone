Rails.application.routes.draw do
  resources :likes
  resources :comments
  devise_for :users
  resources :posts
  resources :users, only: [:index, :show]
  resources :friendships, only: [:index, :create, :update]
  root to: "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

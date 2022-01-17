Rails.application.routes.draw do

  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'
  root 'users#index'
  resources :users

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  post 'logout', to: 'user_sessions#destroy'
end

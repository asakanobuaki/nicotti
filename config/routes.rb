Rails.application.routes.draw do

  root 'static_pages#index'

  resources :users
  
  resources :smokings, only: %i[create destroy index]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  post 'logout', to: 'user_sessions#destroy'
end

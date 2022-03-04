Rails.application.routes.draw do

  get 'inquiries/new'
  get 'inquirys/new'
  root 'static_pages#index'
  get 'terms', to: 'static_pages#terms'
  get 'privacy', to: 'static_pages#privacy'

  resources :users
  resources :smokings, only: %i[create destroy index]
  resources :inquiries, only: %i[create new]

  get 'login', to: 'user_sessions#new'
  get 'guest_login', to: 'user_sessions#guest_login'
  post 'login', to: 'user_sessions#create'
  post 'logout', to: 'user_sessions#destroy'
end

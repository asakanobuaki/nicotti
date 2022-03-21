Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'inquiries/new'
  root to: 'static_pages#index'
  get 'terms', to: 'static_pages#terms'
  get 'privacy', to: 'static_pages#privacy'

  post 'callback', to: 'line_bot#callback'

  resources :users
  resources :smokings, only: %i[create destroy index]
  resources :inquiries, only: %i[create new]

  get 'login', to: 'user_sessions#new'
  get 'guest_login', to: 'user_sessions#guest_login'
  post 'login', to: 'user_sessions#create'
  post 'logout', to: 'user_sessions#destroy'
end

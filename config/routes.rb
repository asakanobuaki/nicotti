Rails.application.routes.draw do

  root 'static_pages#index'

  resources :users do
    collection do
      get :reborn
    end
  end
  
  resources :smokings, only: %i[create destroy]

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  post 'logout', to: 'user_sessions#destroy'
end

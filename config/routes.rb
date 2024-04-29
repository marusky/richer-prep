Rails.application.routes.draw do
  get 'up', to: 'rails/health#show', as: :rails_health_check

  get 'secret', to: 'pages#secret'

  resources :users, only: %i[index destroy]
  get 'register', to: 'users#new'
  post 'register', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root 'pages#home'
end

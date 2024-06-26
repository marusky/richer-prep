Rails.application.routes.draw do
  scope '(:locale)' do
    resources :transactions
    resources :categories do
      collection { get 'other', to: 'categories#show' }
    end
    devise_for :users
  end

  get 'secret', to: 'pages#secret'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', :as => :rails_health_check

  # Defines the root path route ("/")
  get ':locale', to: 'pages#home', as: :root_with_locale
  root 'pages#home'
end

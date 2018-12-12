Rails.application.routes.draw do
  get 'password_resets/new'
  resources :families
  resources :children
  resources :sessions, only: [:new, :create]
  resources :playdates
  resources :users
  resources :password_resets
  resources :user_activations
  resources :requests
  get '/home' => 'users#home'
  get '/settings' => 'families#settings'
  get '/add' => 'families#add'
  get '/signup' => 'families#new'
  get '/login' => 'sessions#new'
  post '/logout' => 'sessions#destroy'
  post '/requests' => 'request#create'
  root to: 'static#welcome'

  resources :playdates do
    resources :comments
  end



end
Rails.application.routes.draw do
  get 'password_resets/new'
  resources :families, only: [:create, :update, :show]
  resources :children, only: [:show, :update]
  resources :sessions, only: [:new, :create]
  resources :playdates
  resources :users  
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :user_activations, only: [:new, :create, :edit, :update]
  resources :requests
  get '/home' => 'users#home' 
  get '/settings' => 'families#settings'
  get 'families' => 'families#index'
  get '/signup' => 'families#new'
  get '/login' => 'sessions#new'
  post '/logout' => 'sessions#destroy'
  post '/requests' => 'request#create'
  post '/message' => 'children#message'
  root to: 'static#welcome'

end
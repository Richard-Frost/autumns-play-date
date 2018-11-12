Rails.application.routes.draw do
  get 'password_resets/new'
  resources :families
  resources :children
  resources :sessions, only: [:new, :create]
  resources :playdates
  resources :users
  resources :password_resets
  resources :user_activations
  get '/settings' => 'families#settings'
  get '/add' => 'families#add'
  get '/signup' => 'families#new'
  get '/login' => 'sessions#new'
  post '/logout' => 'sessions#destroy'
  root to: 'static#welcome'
end

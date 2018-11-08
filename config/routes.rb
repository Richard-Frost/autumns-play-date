Rails.application.routes.draw do
  get 'password_resets/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :families
  resources :children
  resources :sessions, only: [:new, :create]
  resources :playdates
  resources :users
  resources :password_resets
  get '/add' => 'families#add'
  get '/signup' => 'families#new'
  get '/login' => 'sessions#new'
  post '/logout' => 'sessions#destroy'
end

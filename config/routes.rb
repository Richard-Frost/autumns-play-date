Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :families
  resources :children
  resources :parents
  resources :sessions, only: [:new, :create]
  get '/signup' => 'families#new'
  get '/login' => 'sessions#new'
  post '/logout' => 'sessions#destroy'
end

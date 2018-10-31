Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :families
  resources :children
  resources :parents
  get '/signup' => 'families#new'
end

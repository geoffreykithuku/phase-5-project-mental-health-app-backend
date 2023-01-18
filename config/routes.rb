Rails.application.routes.draw do
  resources :appointments
  resources :doctors
  resources :patients
  
  post '/patients', to: "patients#create"

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

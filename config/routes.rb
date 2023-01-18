Rails.application.routes.draw do
  resources :appointments
  resources :doctors
  resources :patients
  
  post '/signup', to: "patients#create"
  post '/csignup', to: "doctors#create"
post '/newappointment', to: "appointments#create"
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  delete '/appointments/:id', to: 'appointments#destroy'
  patch '/appointments/:id/approve', to: 'appointments#approve'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

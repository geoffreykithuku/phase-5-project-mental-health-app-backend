Rails.application.routes.draw do
  resources :appointments
  resources :doctors
  resources :patients
   get '/me', to: "patients#show"
   get '/cme', to: "doctors#show"
  post '/signup', to: "patients#create"
  post '/csignup', to: "doctors#create"
post '/newappointment', to: "appointments#create"
  post '/login', to: 'sessions#create'
  post '/clogin', to: 'csessions#create'
   delete '/clogout', to: 'csessions#destroy'
  delete '/logout', to: 'sessions#destroy'
  delete '/appointments/:id', to: 'appointments#destroy'
  patch '/appointments/:id/approve', to: 'appointments#approve'
  patch '/appointments/:id/complete', to: 'appointments#complete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

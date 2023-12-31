Rails.application.routes.draw do
  resources :mpesas
  # Admin routes
  # get "/adminSignup", to: "admins#create"

  # session routes
  # admin
  post "/adminlogin", to: "admin_sessions#create"
  delete "/adminlogout", to: "admin_sessions#destroy"
  get "/autoLogInDoc", to: "admins#show"

  # Client
  post "/clientSignup", to: "clients#create"

  post "/login", to: "client_sessions#create"
  delete "/logout", to: "client_sessions#destroy"
  # get "/me", to: "client_sessions#show"
  get "/me", to: "client_sessions#auto_login"

  resources :payments
  resources :bookings
  resources :spaces
  resources :clients
  resources :admins, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
#mpesa route
post 'stkpush', to: 'mpesas#stkpush'
post 'stkquery', to: 'mpesas#stkquery'
  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  resources :notes
  resources :users
  resource :users, only: [:create]
  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'
  post '/register', to: 'users#create'
end

Rails.application.routes.draw do
  root "welcome#home"
  resources :rides
  resources :attractions
  resources :users
  # resources :registrations, only: [:new, :create, :destroy]
  # resources :sessions, only: [:new, :create, :destroy]
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: "sessions#destroy"
  post '/attractions/:id/ride', to: "attractions#ride"
end

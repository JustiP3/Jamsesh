Rails.application.routes.draw do

  resources :comments
  #Custom Sessions Routes ##
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #omniauth
  get '/auth/github/callback', to: 'sessions#create'

  #Root
  root 'static#home'

  #Custom quit band route
  post '/bands/:band_id/users/:id', to: 'users#quit'



  resources :users, only: [:new, :edit, :update, :create, :show, :index]
  resources :bands do 
    resources :users, only: [:show, :index]
  end 
  resources :posts, only: [:edit, :create, :show, :update, :destroy] do 
    resources :comments, only: [:index, :new]
  end 
  resources :comments, only: [:create]
  resources :tags, only: [:create, :index]
  
end

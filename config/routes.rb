Rails.application.routes.draw do

  #Custom Sessions Routes ##
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #Root
  root 'static#home'


  resources :users, only: [:new, :edit, :update, :create, :show, :index]
  resources :bands do 
    resources :users, only: [:show, :index]
  end 
  resources :posts, only: [:edit, :create, :show, :update, :destroy]
  resources :tags, only: [:create, :index]
  
end

Rails.application.routes.draw do

  #Custom Sessions Routes ##
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  #Root
  root 'static#home'


  resources :users, only: [:new, :edit, :update, :create, :show, :index]
  resources :bands, only: [:index, :show, :new, :edit, :update, :create] do 
    resources :users, only: [:show, :index]
  end 
  
end

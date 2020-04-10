Rails.application.routes.draw do
  get 'bands/index'
  get 'bands/show'
  get 'bands/new'
  get 'bands/edit'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :edit, :update, :create, :show, :index]
  
end

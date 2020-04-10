Rails.application.routes.draw do
  get '/signup', to: 'sessions#signup'
  get 'login', to: 'sessions#login'
  destroy '/sessions/:id', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :edit, :update, :create, :show, :index]
  
end

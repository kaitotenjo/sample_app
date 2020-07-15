Rails.application.routes.draw do
  root 'static_pages#home'

  get 'sessions/new'
  get '/signup', to: 'users#new'
  get 'sessions/new'
  get '/signup', to: 'users#new'
  get '/help' , to: 'static_pages#help'
  get '/about' ,to: 'static_pages#about'
  get '/contact' , to: 'static_pages#contact'
  get '/login',to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/loguot', to:'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
end

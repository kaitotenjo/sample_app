Rails.application.routes.draw do
  root 'static_pages#home'

  get 'password_resets/new'
  get 'password_resets/edit'
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
  resources :password_resets, only: [:new, :create, :edit, :update]
end

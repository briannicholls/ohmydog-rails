Rails.application.routes.draw do
  devise_for :users
  resources :walks do
    get 'all', on: :collection
    resources :pets, only: [:show]
  end

  resources :owners do
    resources :pets
  end

  resources :users
  resources :pets

  get 'login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'signup', to: 'static#signup'
  post 'signup', to: 'users#signup'

  get '/auth/google_oauth2/callback', to: 'static#google_login'

  root 'static#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

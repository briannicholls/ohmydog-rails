Rails.application.routes.draw do
  resources :walks do
    get 'all', on: :collection
  end


  resources :owners do
    resources :pets
  end
  resources :users
  resources :pets

  get 'login', to: 'sessions#new'
  get 'signup', to: 'static#signup'
  get 'logout', to: 'sessions#destroy'

  get '/auth/google_oauth2/callback', to: 'static#google_login'

  root 'static#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

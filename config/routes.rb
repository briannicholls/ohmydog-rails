Rails.application.routes.draw do
  resources :walks
  resources :owners do
    resources :pets
  end
  resources :users
  resources :pets

  root 'static#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  get "up" => "rails/health#show", as: :rails_health_check

  resources :walks do
    get "all", on: :collection
    resources :pets, only: [:show]
  end

  resources :owners do
    resources :pets
  end

  resources :users
  resources :pets

  root "static#welcome"
end

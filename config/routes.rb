Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#show'

  get 'auth/fitbit', as: :fitbit_login
  get 'auth/fitbit/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:show]
  resources :dashboard, only: [:index]

  resources :meals

  resources :goals

  get 'dashboard/date', to: 'dashboard#show', as: :dashboard_show
end

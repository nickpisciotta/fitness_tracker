Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#show'

  get 'auth/fitbit', as: :fitbit_login
  get 'auth/fitbit/callback', to: 'sessions#create'
end

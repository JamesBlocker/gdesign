Rails.application.routes.draw do

  root 'users#index'
  resources :users
  resources :studios

  # rails automatic path alias assignment
  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]
end

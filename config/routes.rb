Rails.application.routes.draw do

  get 'studios/index'

  get 'studios/show'

  get 'studios/new'

  get 'studios/create'

  get 'studios/edit'

  get 'studios/update'

  get 'studios/destroy'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root 'users#index'
  resources :users

  # rails automatic path alias assignment
  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]
end

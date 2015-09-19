Rails.application.routes.draw do
  root 'home#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :home, only: [:index]
  resources :books, only: [:index, :show]
  resources :sessions, only: [:create, :destroy]
end

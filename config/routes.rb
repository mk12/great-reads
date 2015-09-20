Rails.application.routes.draw do
  root 'home#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :home, only: [:index]
  resources :books, only: [:index, :show] do
    get :search, on: :member
    post :upload, on: :collection
  end

  resources :sessions, only: [:create, :destroy]
end

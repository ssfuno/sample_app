Rails.application.routes.draw do
  root 'posts#index'

  resources :posts, except: [:index]
  post 'posts/:id/fav/create', to: 'favorites#create'
  delete 'posts/:id/fav/destroy', to: 'favorites#destroy'

  resources :users, only: [:new, :create]
  get 'user/:id/fav/', to: 'favorites#show'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
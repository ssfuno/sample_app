Rails.application.routes.draw do
  root 'posts#index'

  resources :posts

  get 'user/new', to: 'users#new'
  post 'user', to: 'users#create'
  post 'login', to: 'users#login'
  get 'logout', to: 'users#logout'
  get 'user/:id/fav/', to: 'users#fav'

  # get 'posts/:id/fav/new', to: 'favs#new'
  # post 'posts/:id/fav/', to: 'favs#create'
  # delete 'posts/:id/fav/destroy', to: 'favs#destroy'
end
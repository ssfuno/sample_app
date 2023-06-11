Rails.application.routes.draw do
  root 'recipes#index'

  devise_for :users
  get 'users/user_id:/favorites', to: 'favorites#index', as: 'user_favorite'

  # resources :users, only: [:new, :create] do
  #   resources :favorites, only: [:show]
  # end
  
  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy'

  resources :recipes, except: [:index] do
    resource :favorites, only: [:create, :destroy]
  end
end
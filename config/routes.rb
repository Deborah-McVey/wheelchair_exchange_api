Rails.application.routes.draw do
  get 'sessions/create'
    post 'login', to: 'sessions#create'
  resources :comments
  resources :posts
  resources :users, only: [:create]
end

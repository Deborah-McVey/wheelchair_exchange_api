Rails.application.routes.draw do
    post 'login', to 'sessions#create'
  resources :comments
  resources :posts
  resources :users, only: [:create]
end

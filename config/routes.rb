Rails.application.routes.draw do
  root 'users#new'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
end

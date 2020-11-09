Rails.application.routes.draw do
  root 'users#new'
  resource :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end

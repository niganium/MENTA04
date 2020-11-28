Rails.application.routes.draw do
  root 'tops#top'
  resource :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts
  resource :favorites
end

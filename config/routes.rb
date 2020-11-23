Rails.application.routes.draw do
  root 'categories#index'
  resources :votes, only: %i[create]
  delete '/votes', to: 'votes#destroy'
  resources :articles, only: %i[new create index]
  resources :categories, only: %i[index]
  devise_for :users
end

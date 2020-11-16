Rails.application.routes.draw do
  root 'static_pages#home'
  resources :votes, only: %i[create]
  delete '/votes', to: 'votes#destroy'
  resources :articles, only: %i[new create index]
  resources :categories, only: %i[new create index]
  devise_for :users
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
end

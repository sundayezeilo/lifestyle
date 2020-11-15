Rails.application.routes.draw do
  root 'categories#index'
  get 'categories/new'
  resources :articles, only: %i[new create index]
  resources :categories, only: %i[new create index]
  devise_for :users
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
end

Rails.application.routes.draw do
  resources :articles, only: %i[new create index]
  root 'static_pages#home'
  devise_for :users
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
end

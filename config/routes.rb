Rails.application.routes.draw do

  root 'welcome#index'
  resources :articles

  # get '/articles', to: 'articles#index'
end

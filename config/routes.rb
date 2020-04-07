Rails.application.routes.draw do
  resources :articles

  # get '/articles', to: 'articles#index'
end

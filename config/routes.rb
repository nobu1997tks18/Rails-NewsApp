Rails.application.routes.draw do
  root 'users#index'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/easy_login', to: 'sessions#easy_login'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
    member do
      get :followings, :followers
    end
  end
  get '/about', to: 'users#about'
  resources :relationships, only:[:create, :destroy]
  resources :posts, only:[:new,:create, :destroy]
  get 'news/topics'
  get 'news/bbc'
  get 'news/wsj'
  get 'news/yahoo'
  get 'news/nhk'
  get 'news/goal'
  get 'news/soccer_king'
  
end

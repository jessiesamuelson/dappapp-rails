Rails.application.routes.draw do
  resources :messages

  get '/users/twitterlogin' => :twitter_login, controller: :users

  get '/users/twitter_callback' => :twitter_callback, controller: :users

  resources :users

  post '/login' => :login, controller: :users
  delete '/login' => :logout, controller: :users




end

Rails.application.routes.draw do
  resources :messages

  resources :users

  post '/login' => :login, controller: :users
  delete '/login' => :logout, controller: :users


end

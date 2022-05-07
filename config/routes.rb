Rails.application.routes.draw do
  root to: 'homes#top'

  devise_for :user


  get "/homes/about" => "homes#about", as: "about"

  resources :users
  resources :books


end

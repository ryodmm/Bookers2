Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only:[:edit, :show]
  resources :books, only:[:new, :index, :show, :edit]
  
  get "/homes/about" => "homes#about", as: "about"
end

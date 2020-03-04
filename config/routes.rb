Rails.application.routes.draw do
  root 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => "sessions#create"
  post '/logout' => "sessions#destroy"
  # resources :quote_tags
  get 'quotes/new', to: "quotes#new1"
  post 'quotes/new', to: "quotes#add"
  post 'quotes/add', to: 'quotes#add'
  get 'quotes/newbook', to: "quotes#newbook"
  post 'quotes/newbook', to: "quotes#create2"
  get 'quotes/newmovie', to: "quotes#newmovie"
  post 'quotes/newmovie', to: "quotes#create2"
  resources :quotes, only: [:index, :show, :edit, :update, :delete]
  resources :tags
  resources :books
  resources :users
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


Rails.application.routes.draw do
  root 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => "sessions#create"
  post '/logout' => "sessions#destroy"
  # resources :quote_tags
  get 'quotes/new', to: "quotes#new1"
  post 'quotes/new', to: "quotes#create1"
  get 'quotes/new-book', to: "quotes#newbook"
  post 'quotes/new-book', to: "quotes#create2"
  get 'quotes/new-movie', to: "quotes#newmovie"
  post 'quotes/new-movie', to: "quotes#create2"
  resources :quotes, only: [:index, :show, :edit, :update, :delete]
  resources :tags
  resources :books
  resources :users
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


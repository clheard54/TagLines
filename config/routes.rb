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
  get 'quotes/user_quotes', to: "quotes#user_quotes", as: "user_quotes"
  resources :quotes, only: [:index, :show, :edit, :update, :delete]
  resources :tags
  resources :books
  get 'users/:id/my_books', to: "users#my_books"
  get 'users/:id/my_movies', to: "users#my_movies"
  resources :users
  resources :movies

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


Rails.application.routes.draw do
  resources :quote_tags
  resources :quotes, only: [:index, :show, :edit, :update, :delete]
  get 'quotes/new', to: "quotes#new1"
  post 'quotes/new', to: "quotes#create1"
  get 'quotes/new-step2', to: "quotes#new2"
  post 'quotes/new-step2', to: "quotes#create2"
  resources :tags
  resources :books
  resources :users
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

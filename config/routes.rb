Rails.application.routes.draw do
  resources :users, only: [:show]

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :games do
    resources :reviews, only: [:index, :new, :create]
  end

  resources :game_entries, only: [:index, :create, :edit, :update, :destroy]
end
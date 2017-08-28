Rails.application.routes.draw do
  resources :categories, only: [:index, :show]
  resources :users, only: [:show]
  resources :articles, only: [:show, :create]

  root to: "categories#index"
end

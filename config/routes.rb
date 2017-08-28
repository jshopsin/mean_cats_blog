Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create]

  resources :categories, only: [:index, :show]

  resources :categories, only:[] do
    resources :articles, only: [:new, :create]
  end

  resources :articles, only: [:show]

  resources :logins, only: [:new, :create, :destroy]

  root to: "categories#index"
end

Rails.application.routes.draw do
  resources :tasks
  resources :projects, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/user/:id/account', to: 'users#account', as: 'user_account'

  resources :projects, only: [:show] do
    resources :tasks, only: [:index, :new, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

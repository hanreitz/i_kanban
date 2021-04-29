Rails.application.routes.draw do
  resources :tasks
  resources :projects
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/user/:id/account', to: 'users#account', as: 'user_account'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root 'sessions#welcome'

  resources :tasks
  resources :projects, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/user/:id/account', to: 'users#account', as: 'user_account'
  post '/advance-category', to: 'tasks#advance_category', as: 'advance_category'
  post '/back-category', to: 'tasks#back_category', as: 'back_category'
  get 'project/:id/my_tasks', to: 'projects#my_tasks', as: 'my_tasks'
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :projects, only: [:show] do
    resources :tasks, only: [:new, :show]
  end

  get '*path', to: 'sessions#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

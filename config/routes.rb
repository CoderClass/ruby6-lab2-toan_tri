Rails.application.routes.draw do
  get 'sessions/new'
  get 'login', to: 'sessions#new'

  resources :sessions, only: [:new, :create, :destroy]
  root 'welcome#index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'components' => 'pages#components'

  resources :preferences, only: [ :update, :index]

  resources :topics, only: [ :create, :update, :destroy]
  resources :keywords, only: [ :create, :update, :destroy]
  resources :content, only: [ :update]
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'components' => 'pages#components'
  get 'loadingpage' => 'pages#loadingpage'
  get 'datadashboard' => 'pages#datadashboard'
  get 'userdashboard' => 'pages#userdashboard'

  resources :preferences, only: [ :update, :index]

  resources :topics, only: [ :create, :update, :destroy]
  resources :keywords, only: [ :create, :update, :destroy]
  resources :contents, only: [ :index, :update]
  resources :userstatistiques, only: [ :index, :show]
end

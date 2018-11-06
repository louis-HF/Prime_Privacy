Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'registrations', :omniauth_callbacks =>  "callbacks"}
  post '/auth/:provider/callback' => 'authentications#create'
  root to: 'pages#home'

  get 'components' => 'pages#components'
  get 'loadingpage' => 'pages#loadingpage'

  resources :preferences, only: [ :update, :index]
  resources :topics, only: [:new, :create, :update, :destroy]
  resources :keywords, only: [ :create, :update, :destroy]
  resources :contents, only: [ :index, :update]
  resources :userstatistics, only: [ :index, :show]
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end

# frozen_string_literal: true

Rails.application.routes.draw do
  resources :players, only: :show
  resources :characters, only: :show
  resources :campaigns, only: :show
  resources :monsters, only: :show

  get 'search', to: 'players#search', as: 'search'
  get 'about', to: 'players#about', as: 'about'
  root to: 'players#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# frozen_string_literal: true

Rails.application.routes.draw do
  get 'campaigns/index'
  get 'campaigns/show'
  get 'monsters/index'
  get 'monsters/show'
  get 'characters/index'
  get 'characters/show'
  get 'players/index'
  get 'players/show'

  resources :players, only: :show
  resources :characters, only: :show

  get 'search', to: 'players#search', as: 'search'

  root to: 'players#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

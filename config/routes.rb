# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :articles, only: %w[index new create show destroy]

  root 'articles#index'
end

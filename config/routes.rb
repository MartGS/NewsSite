# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :articles, only: %w[index new create show destroy]
  resources :build_article, only: [:show, :update], controller: 'steps_controllers/article_steps'

  root 'articles#index'
end

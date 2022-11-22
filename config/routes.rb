# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'groups/index', to: 'groups#index'

  resources :groups do
    resources :expenses
  end
  root "groups#index"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end

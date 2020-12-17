# frozen_string_literal: true
Rails.application.routes.draw do
  devise_scope :user do
    root to: 'overview#index'
    get 'bank_login/index' => 'devise/sessions#new' # custom path to login/sign_in
  end

  devise_for :users, path: 'bank_login', skip: [:registrations]

  resources :users do
    member do
      get :delete
    end
  end

  get '/', to: 'welcome#index'

  get 'payments', to: 'payments#index'
  post 'payments', to: 'payments#create'

  get 'transactions', to: 'transactions#index'

  get 'welcome',  to: 'welcome#index'
  get 'welcome/contact-us', to: 'welcome#contactus'
  get 'welcome/find-branch', to: 'welcome#findbranch'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

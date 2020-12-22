# frozen_string_literal: true
Rails.application.routes.draw do
  get 'themes/themes'
  devise_scope :user do
    root to:'welcome#index'
    #root to: 'overview#index'
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

  get 'themes', to: 'themes#themes'


  get 'welcome',  to: 'welcome#index'
  get 'welcome/contact-us', to: 'welcome#contactus'
  get 'welcome/find-branch', to: 'welcome#findbranch'
  get 'welcome/overview', to: 'welcome#overview'
  get 'welcome/make_transaction', to: 'welcome#make_transaction'
  post 'welcome/save_transaction', to: 'welcome#save_transaction'
  get 'welcome/transactions/:account_id', to: 'welcome#transactions'
  resources :accounts
  resources :transactions
  #get 'Log out', to: 'welcome#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

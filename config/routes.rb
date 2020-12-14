Rails.application.routes.draw do

  get 'welcome/index'
  # TODO: https://github.com/heartcombo/devise/wiki/How-to-Setup-Multiple-Devise-User-Models

  root to: 'welcome#index'

  devise_scope :user do
    get 'bank_login/index' => 'devise/sessions#new' # custom path to login/sign_in
  end

  devise_for :users, path: 'bank_login', skip: [:registrations]

  resources :users do
    member do
      get :delete
    end
  end

  get 'payments', to: 'payments#index'
  post 'payments', to: 'payments#create'

  get 'transactions', to: 'transactions#index'

  get 'welcome',  to: 'welcome#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

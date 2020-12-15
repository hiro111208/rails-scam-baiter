Rails.application.routes.draw do
  # TODO: https://github.com/heartcombo/devise/wiki/How-to-Setup-Multiple-Devise-User-Models

  root to: 'overview#index'

  devise_scope :user do
    get 'bank_login/index' => 'devise/sessions#new' # custom path to login/sign_in
  end

  devise_for :users, path: 'bank_login', skip: [:registrations]

  resources :users do
    member do
      get :delete
    end
  end

  resources :transactions do
    member do
      get :delete
    end
  end

  get 'payments', to: 'payments#index'
  post 'payments', to: 'payments#create'

  get 'transactions', to: 'transactions#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'transactions/transactions'
  # TODO: https://github.com/heartcombo/devise/wiki/How-to-Setup-Multiple-Devise-User-Models

  root to: 'overview#index'

  devise_scope :user do
    get 'bank_login/index' => 'devise/sessions#new' # custom path to login/sign_in
  end

  devise_for :users, path: 'bank_login', skip: [:registrations]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

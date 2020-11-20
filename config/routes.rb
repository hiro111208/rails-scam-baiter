Rails.application.routes.draw do
  get 'bank_login/index'
  post 'bank_login/login'

  get 'demo/index'

  get 'demo/hello'

  get 'demo/contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

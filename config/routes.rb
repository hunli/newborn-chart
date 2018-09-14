Rails.application.routes.draw do
  get 'login/index'
  get 'user/index'
  get 'sign_up/new'
  get 'welcome/index'

  post 'login/signin'
  post 'sign_up/create'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

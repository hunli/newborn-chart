Rails.application.routes.draw do
  get 'pump/new'
  get 'diaper_change/index'
  get 'feed/index'
  get 'login/index'
  get 'pump/index'
  get 'sign_up/new'
  get 'user/index'
  get 'welcome/index'

  post 'diaper_change/create'
  post 'feed/create'
  post 'login/signin'
  post 'pump/create'
  post 'sign_up/create'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

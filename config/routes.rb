Rails.application.routes.draw do
  get 'user/index'
  get 'sign_up/new'
  post 'sign_up/create'
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

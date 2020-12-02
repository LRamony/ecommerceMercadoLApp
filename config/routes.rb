Rails.application.routes.draw do
  
  namespace :backoffice do
    get 'categories/index'
  end
  get 'admin', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    get 'dashboard', to: 'dashboard#index'
  end
  namespace :site do
    get 'home', to: 'home#index'
  end
  devise_for :admins
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'site/home#index'
end

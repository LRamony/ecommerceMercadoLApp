Rails.application.routes.draw do
  root 'site/home#index'

  get 'admin', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    #only: [:edit, :update, :show, :destory] <- so quero mostrar
    resources :categories, except: [:show] #<- so n quero mostrar
    resources :admins, except: [:show]
    get 'categories/index'
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :site do
    get 'home', to: 'home#index'
  end

  devise_for :admins
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

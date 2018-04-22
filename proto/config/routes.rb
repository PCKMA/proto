Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

#  get 'home/index'
  resources :home, :inscontracts, :claims

#  get 'home/authentication'

  devise_scope :member do
    get 'sign_out', to: 'sessions#destroy'
  end

  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

end

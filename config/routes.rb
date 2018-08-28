Rails.application.routes.draw do

  devise_for :admins
  devise_for :users, controllers: {registration: "registrations"}


  resources :wikis
  resources :charges, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'welcome/index'
  root 'welcome#index'
end

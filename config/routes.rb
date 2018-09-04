Rails.application.routes.draw do

 get 'users/premium_to_standard'
 get 'users/standard_to_premium'

  devise_for :admins
  devise_for :users, controllers: {registration: "registrations"}
  resources :users, only: [] do
     post 'premium_to_standard' => 'users#premium_to_standard', as: :premium_to_standard
    post 'standard_to_premium' => 'users#standard_to_premium', as: :standard_to_premium

 end



  resources :wikis
  resources :charges, only: [:new, :create]
  resources :collaborators, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'welcome/index'
  root 'welcome#index'
end

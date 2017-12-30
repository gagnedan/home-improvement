Rails.application.routes.draw do
  
	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
	devise_scope :user do
  	get "/" => "devise/sessions#new"
	end

  root :to => "devise/sessions#new"

  resources :projects, :shallow => true do
  	resources :comments, only: [:index, :create]
  end

  namespace :admin do
    resources :projects
    resources :users, only: [:index, :destroy]
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

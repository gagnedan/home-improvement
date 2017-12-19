Rails.application.routes.draw do
  devise_for :users
  
	devise_scope :user do
		get "/" => "devise/sessions#new"
	end

	root :to => "devise/sessions#new"

	get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

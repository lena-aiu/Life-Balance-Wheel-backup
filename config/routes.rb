Rails.application.routes.draw do
  resources :activities do
	resources :exercises
    end
  get 'home/index'
  resources :users

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

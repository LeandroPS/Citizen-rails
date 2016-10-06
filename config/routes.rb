Rails.application.routes.draw do

  devise_for :users
  get 'home/index'

  
  resources :causas do
		resources :comentarios
		resources :apoio
		collection do
 			get :listar
		end
	end
  resources :cidades
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	root to: "home#index"
end

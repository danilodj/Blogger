Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root to: 'articles#index'

	resources :articles do
		resources :comments
		patch :archived
	end
	resources :tags, only: [ :index, :show]

	resources :authors
	
	resources :author_sessions, only: [ :new, :create, :destroy]

	get 'login' => 'author_sessions#new'
	get 'logout' => 'author_sessions#destroy'

end

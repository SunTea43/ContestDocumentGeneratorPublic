Rails.application.routes.draw do
  get 'home/index'
  resources :team_members
  resources :teams do
	post :import_teams
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end

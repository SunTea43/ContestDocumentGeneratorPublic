Rails.application.routes.draw do
  get 'home/index'
  resources :team_members
  resources :teams do
    collection do 
      post :import_teams, to: 'teams#import_teams'
      get :documents, to: 'teams#documents'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end

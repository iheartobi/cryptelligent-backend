Rails.application.routes.draw do
        resources :teams
        resources :leagues
        resources :users
        resources :coins, only: [:index, :show]
        post '/login', to: 'auth#create'
        get '/profile', to: 'users#profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

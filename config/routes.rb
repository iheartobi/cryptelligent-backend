Rails.application.routes.draw do
  resources :transactions
        resources :users
        resources :coins
        post '/login', to: 'auth#create'
        get '/profile', to: 'users#profile'
        delete '/transactions', to: 'transactions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

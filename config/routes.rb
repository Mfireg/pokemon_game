Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :characters, except: %i[index] do
    member do
      post '/throw_pokeball', to: 'characters#throw_pokeball'
    end
  end
  
  get '/map', to: 'map#index'
  post '/walk_into_map', to: 'map#walk', as: 'walk_around'
  get '/battle', to: 'map#battle'

  # Defines the root path route ("/")
  # root "articles#index"
end


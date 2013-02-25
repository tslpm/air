OneWayAir::Application.routes.draw do

  resources :reservations


  get "/login" => 'sessions#new', as: :login

  post "sessions/create" => 'sessions#create', as: :create_session

  get "/logout" => 'sessions#destroy', as: :logout

  resources :users


  root :to => 'flights#index'

end

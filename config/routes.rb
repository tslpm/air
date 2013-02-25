OneWayAir::Application.routes.draw do

  resources :reservations

  post '/reservations', controller: 'reservations', action: 'create'

  # def dispatch()
  #  x = ReservationsController.new
  #  x.create
  # end
  get "/login" => 'sessions#new', as: :login

  post "sessions/create" => 'sessions#create', as: :create_session

  get "/logout" => 'sessions#destroy', as: :logout

  resources :users


  root :to => 'flights#index'

end

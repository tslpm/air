OneWayAir::Application.routes.draw do

  resources :users


  root :to => 'flights#index'

end

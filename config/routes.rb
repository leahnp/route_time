Rails.application.routes.draw do

  root 'routes#new'

  # login with google plus
  get 'login'                    => 'sessions#create', as: :login
  get "/auth/:provider/callback" => "sessions#create"
  delete 'logout'                => 'sessions#destroy', as: :logout

  # add/delete a location to/from 'my locations'
  get 'routes/new'               => 'routes#new', as: :locations
  post '/routes/new'             => 'routes#create'
  delete 'routes/delete'         => 'routes#destroy', as: :destroy_location

  # get route data from api
  post 'routes/info'             => 'routes#get_data', as: :get_data

end

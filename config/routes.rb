Headstart::Application.routes.draw do

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "register" => "users#new", :as => "register"
  #get "event"     => "pages#event", :as => "event"

  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#create'

  resources :users
  resources :sessions
  resources :events

  root :to => "pages#index"

  namespace :admin do
    resources :users
    resources :events
  end

end

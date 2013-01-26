Headstart::Application.routes.draw do
  get "logout"  => "sessions#destroy", :as => "logout"
  get "login"   => "sessions#new", :as => "login"
  get "register"  => "users#new", :as => "register"

  resources :users
  resources :sessions

  root :to => "pages#index"
end

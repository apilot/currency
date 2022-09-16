require "resque/server"
require "resque-scheduler"
require "resque/scheduler/server"
Rails.application.routes.draw do
  mount Resque::Server.new, at: "/resque"
  namespace :admin do
    get "/", to: "setting#currency"
    post "/", to: "setting#create_course"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/vue", to: "pages#vue"

  # Defines the root path route ("/")
  root "pages#stimulus"
end

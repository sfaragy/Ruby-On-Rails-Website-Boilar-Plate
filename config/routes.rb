Rails.application.routes.draw do
  namespace :account do
    get 'login/index'
  end
  get 'jorg/index'
  get 'nh/index'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "account/login#index"
  
end

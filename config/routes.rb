Rails.application.routes.draw do
  
  
  get 'public/index'
  get 'public/show'
  #get 'acess/login'
  root "public#index"

  get 'show/:permalink', :to =>'public#show'

  get 'admin', :to => 'acess#index'
  #get 'demo1/index'
  #get 'demo/index'
  match ':controller(/:action(/:id))', :via => [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

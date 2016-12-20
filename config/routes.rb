Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/json/', to: 'json#index'
  get '/ruby/', to: 'ruby#index'
  get '/test/', to: 'test#index'
  get '/get/', to: 'json#get'
end

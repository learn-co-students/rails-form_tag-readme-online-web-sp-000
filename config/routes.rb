Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :new, :create]# We need to draw a create route so that the routing system knows what to do when a POST request is sent to the /posts resource
end

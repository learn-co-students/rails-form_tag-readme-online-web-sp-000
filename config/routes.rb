Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :new, :create]
  #it appears that resources also creates the new_post route
  # get '/posts/new', to: 'posts#new', as: 'new_post'
end

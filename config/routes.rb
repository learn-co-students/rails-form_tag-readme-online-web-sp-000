Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/r
  resources :posts, only: [:index, :new, :create]
end
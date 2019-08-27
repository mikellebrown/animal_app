Rails.application.routes.draw do
  root "animals#index"
  devise_for :users
  
  resources :animals
end

Rails.application.routes.draw do
  resources :people
  resources :starships
  resources :planets
  resources :films
  root to:  'films#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :maintenance_services, only: %i[new create show]
  resources :cars
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

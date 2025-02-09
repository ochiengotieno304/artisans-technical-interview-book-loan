Rails.application.routes.draw do
  resources :books
  resource :session
  resources :passwords, param: :token
  resource :registration, only: %i[new create]

  get "up" => "rails/health#show", as: :rails_health_check
  root "books#index"
end

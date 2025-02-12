Rails.application.routes.draw do
  resources :books do
    member do
      post :borrow
      post :return
    end

    collection do
      get :borrowed
    end
  end
  resource :session
  resources :passwords, param: :token
  resource :registration, only: %i[new create]

  get "up" => "rails/health#show", as: :rails_health_check
  root "books#index"
end

Rails.application.routes.draw do
  devise_for :users, controllers: {
            sessions: "users/sessions",
            registrations: "users/registrations",
          }
  resources :posts

  get "about", to: "pages#about"
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
end

Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#index"

  get "/checkout", to: "pages#checkout"
end

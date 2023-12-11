Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#index"

  get "/checkout", to: "pages#checkout"
  get "/create-customer", to: "pages#create_customer"
  get "/checkout-success", to: "pages#checkout_success"
  get "/setup-intent", to: "pages#setup_intent"
end

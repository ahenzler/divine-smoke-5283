Rails.application.routes.draw do
  resources :plots
  resources :garden
  # get "/plots", to: "plots#index"
  # get "/plots", to: "plots#index"
end

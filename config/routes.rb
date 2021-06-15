Rails.application.routes.draw do
  resources :gardens, only: [:show]
  resources :plots, only: [:index]
  resources :plants, only: [:destroy]

  delete "plots/:plot_id/plants/:plant_id", to: "plants#delete"
end

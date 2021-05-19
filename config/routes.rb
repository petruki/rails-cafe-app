Rails.application.routes.draw do
  delete "/courses/:id/pricing/unit", to: "courses#destroy_pricing_unit", as: "destroy_pricing_unit"
  post "/courses/:id/pricing/unit", to: "courses#create_pricing_unit"
  delete "/courses/:id/pricing/portion", to: "courses#destroy_pricing_portion", as: "destroy_pricing_portion"
  post "/courses/:id/pricing/portion", to: "courses#create_pricing_portion"

  resources :categories
  resources :courses
  resources :daily_menus

  root 'daily_menus#index'
end

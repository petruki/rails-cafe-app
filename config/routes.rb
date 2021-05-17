Rails.application.routes.draw do
  resources :products
  delete "/products/:id/pricing/unit", to: "products#destroy_pricing_unit", as: "destroy_pricing_unit"
  post "/products/:id/pricing/unit", to: "products#create_pricing_unit"
  delete "/products/:id/pricing/portion", to: "products#destroy_pricing_portion", as: "destroy_pricing_portion"
  post "/products/:id/pricing/portion", to: "products#create_pricing_portion"

  resources :categories
  resources :courses
  resources :daily_menus
end

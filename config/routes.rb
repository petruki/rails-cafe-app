Rails.application.routes.draw do
  resources :categories
  resources :courses
  delete    "/courses/:id/pricing/unit", to: "courses#destroy_pricing_unit", as: "destroy_pricing_unit"
  post      "/courses/:id/pricing/unit", to: "courses#create_pricing_unit"

  resources :daily_menus
  resources :daily_menu_items, only: [:destroy]

  root 'daily_menus#index'
end

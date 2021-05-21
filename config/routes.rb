Rails.application.routes.draw do
  resources :categories
  resources :courses
  delete    "/courses/:id/pricing/unit", to: "courses#destroy_pricing_unit", as: "destroy_pricing_unit"
  post      "/courses/:id/pricing/unit", to: "courses#create_pricing_unit"

  resources :daily_menus
  resources :daily_menu_items
  post      "/daily_menu_items/:menu/:item_id",   to: "daily_menu_items#add"
  get       "/daily_menu_items/edit/:menu/:category",  to: "daily_menu_items#edit"
  get       "/daily_menu_items/update/:menu/:id",   to: "daily_menu_items#show", as: "update_item"

  root 'daily_menus#index'
end

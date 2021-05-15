Rails.application.routes.draw do
  resources :products
  resources :categories
  resources :courses
  resources :daily_menus
end

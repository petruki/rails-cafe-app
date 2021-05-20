class DailyMenu < ApplicationRecord
    has_many :daily_menu_items, dependent: :destroy
end

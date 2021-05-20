class PricingUnit < ApplicationRecord
    belongs_to :course
    has_one :daily_menu_item
end

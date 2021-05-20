class DailyMenuItem < ApplicationRecord
    belongs_to :daily_menu
    has_one :pricing_unit
    has_one :course
end

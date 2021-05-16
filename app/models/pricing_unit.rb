class PricingUnit < ApplicationRecord
    belongs_to :product
    has_many :course_items
end

class Course < ApplicationRecord
    has_many :pricing_units, dependent: :delete_all
    has_one :category
end

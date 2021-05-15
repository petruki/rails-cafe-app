class Product < ApplicationRecord
    has_many :pricing_units
    has_many :pricing_portion
end

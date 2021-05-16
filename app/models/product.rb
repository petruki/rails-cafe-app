class Product < ApplicationRecord
    has_many :pricing_units, dependent: :delete_all
    has_many :pricing_portion, dependent: :delete_all
end

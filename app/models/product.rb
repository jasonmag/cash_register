class Product < ApplicationRecord
    validates :product_code, presence: true, uniqueness: true
end

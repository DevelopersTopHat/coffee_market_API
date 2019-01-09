class Product < ApplicationRecord
    validates :title, presence: true
    validates :price, presence: true 
    validates :inventory_count, presence: true
    validates :description, presence: true    
end

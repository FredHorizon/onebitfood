class Order < ApplicationRecord
  belongs_to :restaurant
  has_many :order_products
end

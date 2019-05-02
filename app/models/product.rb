class Product < ApplicationRecord
  belongs_to :product_category
  has_many :order_products

  validates_associated :product_category
  validates :name, presence: true
  validates :price, presence: true
end

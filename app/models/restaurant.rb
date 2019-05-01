class Restaurant < ApplicationRecord
  belongs_to :category # linka a relação com o model categoria
  has_many :product_categories
  has_many :orders
  has_many :reviews
end

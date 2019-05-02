class Category < ApplicationRecord
    has_many :restaurants # Uma categoria possui vários restaurantes
    
    validates :title, presence: true

    has_one_attached :image # associa uma imagem ao módulo
end

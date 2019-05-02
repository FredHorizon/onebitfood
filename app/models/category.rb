class Category < ApplicationRecord
    has_many :restaurants # Uma categoria possui vários restaurantes
    
    validates :title, presence: true
end

class Category < ApplicationRecord
    has_many :restaurants # Uma categoria possui vários restaurantes
end

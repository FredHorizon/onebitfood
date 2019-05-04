class Restaurant < ApplicationRecord
  belongs_to :category # linka a relação com o model categoria
  has_many :product_categories
  has_many :orders
  has_many :reviews

  validates_associated :category # é obrigatório haver uma categoria antes de inserir um restaurante
  validates :name, presence: true
  validates :status, presence: true
  validates :delivery_tax, presence: true
  validates :city, presence: true
  validates :street, presence: true

  enum status: { closed: 0, open: 1 } # um restaurante pode estar ABERTO ou FECHADO

  has_one_attached :image

  geocoded_by :address # geolocalização que será feita por meio do método adrress

  after_validation :geocode

  def address
    [street, number, city, state].compact.join(', ')
  end
end

class Car < ApplicationRecord
  belongs_to :owner
  has_many :clients, through :bookings
  validates :model, :brand, :price, presence: true
  validates :price, numericality: { greater_than: 150 }
end

class Client < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :cars, through: :bookings

end

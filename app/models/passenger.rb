class Passenger < ApplicationRecord

  validates :name, :email, presence: true, uniqueness: true
  has_many :booking_passengers
  has_many :bookings, through: :booking_passengers
end

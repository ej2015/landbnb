class Rental < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews

  validates :user, :rental_type, :accomodates, :bathrooms, :bedrooms, :beds, :nightly_cost, :street1, :city, :country, presence: true
end

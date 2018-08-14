class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :rental

  validates :user, :rental, :start_date, :stop_date, :guests, presence: true

end

